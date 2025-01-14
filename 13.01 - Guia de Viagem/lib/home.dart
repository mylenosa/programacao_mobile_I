import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? cidadeSelecionada;
  final cidades = ['Porto Velho', 'Ji-Paraná', 'Ariquemes', 'Vilhena'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Guia de Viagem - RO')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            hint: Text('Selecione uma cidade'),
            value: cidadeSelecionada,
            onChanged: (cidade) {
              setState(() {
                cidadeSelecionada = cidade;
              });
            },
            items: cidades.map((cidade) {
              return DropdownMenuItem(
                value: cidade,
                child: Text(cidade),
              );
            }).toList(),
          ),
          if (cidadeSelecionada != null)
            ElevatedButton(
              onPressed: () {
                if (cidadeSelecionada != null) {
                  Navigator.pushNamed(
                    context,
                    '/informacoes',
                    arguments: cidadeSelecionada,
                  );
                }
              },
              child: Text('Ver Informações'),
            ),
        ],
      ),
    );
  }
}
