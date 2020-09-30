import 'package:flutter/material.dart';
import 'package:root_nerd/login.page.dart';
import 'package:root_nerd/cadastroUser.page.dart';
import 'package:root_nerd/home.page.dart';

void main() {
  runApp(MyApp()); // Qual é a classe que será carregada (exibida).
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginPage(),
      routes: {
        '/': (context) => LoginPage(),
        '/cadastroUser': (context) => CadastroUserPage(),
        '/home': (context) => HomePage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
