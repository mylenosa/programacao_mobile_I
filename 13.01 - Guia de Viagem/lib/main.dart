import 'package:flutter/material.dart';
import 'home.dart';
import 'informacoes.dart';

void main() => runApp(GuiaViagemApp());

class GuiaViagemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/informacoes': (context) {
          final cidade = ModalRoute.of(context)!.settings.arguments as String;
          return InformacoesScreen(cidade: cidade);
        },
      },
    );
  }
}
