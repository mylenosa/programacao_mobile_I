import 'dart:math';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> frases = [''];
  String frase = '';

  Future<void> _addfrase(BuildContext context) async {
    final result = await showTextInputDialog(
      context: context,
      message: 'Digite a frase que deseja adicionar a sua lista de motivação:',
      textFields: const [
        DialogTextField(
          hintText: 'Digite sua frase aqui',
        ),
      ],
    );


    if (result != null && result.isNotEmpty) {
      setState(() {
        frases.add(result[0]);
      });
    }
  }


  int randomIndex() =>
    Random().nextInt(frases.length);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add_box_sharp, color: Colors.white),
              onPressed: () => _addfrase(context),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text(
          'Frase Motivacional de Hoje',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'Frase motivacional de hoje: '
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                frase, textAlign: TextAlign.center, style: TextStyle(fontSize: 35),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red),
                  onPressed: () {
                    setState(() {
                      frase = frases[randomIndex()];
                    });
                  },
                  child: const Text(
                    'Sortear Frase',
                    style: TextStyle(color: Colors.white),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}