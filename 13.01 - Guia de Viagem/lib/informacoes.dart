import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

class ClimaServico {
  static const String apiKey = '4ef512d41b6e7189875de820ab91bf3e';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  final Dio dio = Dio();

  Future<double?> buscarTemperatura(String cidade) async {
    try {
      final response = await dio.get(baseUrl, queryParameters: {
        'q': cidade,
        'appid': apiKey,
        'units': 'metric',
        'lang': 'pt_br',
      });

      if (response.statusCode == 200) {
        final dados = response.data;
        return dados['main']['temp'];
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

class InformacoesScreen extends StatefulWidget {
  final String cidade;
  InformacoesScreen({required this.cidade});

  @override
  _InformacoesScreenState createState() => _InformacoesScreenState();
}

class _InformacoesScreenState extends State<InformacoesScreen> {
  double? temperatura;

  @override
  void initState() {
    super.initState();
    _carregarTemperatura();
  }

  Future<void> _carregarTemperatura() async {
    ClimaServico climaServico = ClimaServico();
    double? temp = await climaServico.buscarTemperatura(widget.cidade);
    setState(() {
      temperatura = temp;
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pontosTuristicos = {
      'Porto Velho': [
        {
          'nome': 'Mercado Cultural',
          'descricao': 'mercadão da cidade.',
          'imagem': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/c0/70/d1/caption.jpg?w=900&h=-1&s=1',
          'link': 'https://g.co/kgs/tcDvrgn',
        },
        {
          'nome': 'Hotel Slaviero Porto Velho',
          'descricao': 'Hotel',
          'imagem': 'https://lirp.cdn-website.com/09fed11e/dms3rep/multi/opt/hotel-640w.jpg',
          'link': 'https://g.co/kgs/gZdrDgM',
        },
      ],
    };

    final pontos = pontosTuristicos[widget.cidade] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Informações de ${widget.cidade}')),
      body: ListView(
        children: [
          if (temperatura != null)
            ListTile(
              title: Text('Temperatura Atual'),
              subtitle: Text('$temperatura°C'),
            ),
          ...pontos.map((ponto) {
            return Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(ponto['nome']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ponto['descricao']!),
                    SizedBox(height: 10),
                    Image.network(ponto['imagem']!),
                    TextButton(
                      onPressed: () => _launchURL(ponto['link']!),
                      child: Text('Saiba mais'),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
