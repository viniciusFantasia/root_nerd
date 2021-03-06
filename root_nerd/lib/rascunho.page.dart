// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:flutter/material.dart';
import 'package:root_nerd/itemnerd.widget.dart';

class RascunhoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Rascunhos",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        // children: [
        //   ItemNerd(),
        //   ItemNerd(),
        //   ItemNerd(),
        //   ItemNerd(),
        //   ItemNerd(),
        //   ItemNerd(),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Novo Item Nerd",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastroPost');
        },
        backgroundColor: Color(0xFF99e265),
      ),
    );
  }
}
