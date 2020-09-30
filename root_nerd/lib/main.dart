import 'package:flutter/material.dart';
import 'package:root_nerd/login.page.dart';
import 'package:root_nerd/cadastroUser.page.dart';
import 'package:root_nerd/home.page.dart';
import 'package:root_nerd/comentario.page.dart';
import 'package:root_nerd/detalhe.page.dart';

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
        '/comentario': (context) => ComentarioPage(),
        '/detalhe': (context) => DetalhePage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF000000),
      ),
    );
  }
}
