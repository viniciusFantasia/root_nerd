import 'package:flutter/material.dart';
import 'package:root_nerd/login.page.dart';
import 'package:root_nerd/cadastroUser.page.dart';
import 'package:root_nerd/cadastroPost.page.dart';
import 'package:root_nerd/home.page.dart';
import 'package:root_nerd/comentario.page.dart';
import 'package:root_nerd/detalhe.page.dart';
import 'package:root_nerd/perfil.page.dart';

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
        '/cadastroPost': (context) => CadastroPostPage(),
        '/home': (context) => HomePage(),
        '/comentario': (context) => ComentarioPage(),
        '/detalhe': (context) => DetalhePage(),
        '/perfil': (context) => PerfilPage(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}
