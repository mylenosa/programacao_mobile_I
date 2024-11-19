import 'package:flutter/material.dart';
import 'tela2.dart';

class tela1 extends StatefulWidget {
  const tela1({super.key});

  @override
  State<tela1> createState() => _tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Tela2()),
            );
          },
          child: Text('Próxima Tela'),
        ),
      ),
    );
  }
}