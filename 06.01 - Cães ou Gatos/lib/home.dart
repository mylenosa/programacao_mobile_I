import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final dio = Dio();

  Future<Map<String, dynamic>> getHttp() async {
    final response = await dio.get('https://dog.ceo/api/breeds/image/random');
    print(response);
    return response.data;
  }

  Map<String, dynamic> resposta = {};

  var http =
      'https://images.dog.ceo/breeds/bullterrier-staffordshire/n02093256_7830.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cachorrinhos Bunitos'),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    http,
                    width: 300,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () async {
                  resposta = await getHttp();
                  setState(() {
                    for (var entry in resposta.entries) {
                      print(entry.key + entry.value);
                      http = entry.value;
                      print(http);
                      break;
                    }
                  });
                },
                child: Text('Clique aqui para ver um cachorro bunito!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
