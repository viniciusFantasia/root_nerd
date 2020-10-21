// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:flutter/material.dart';
import 'package:root_nerd/itemnerd.widget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "RootNerd - Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          DrawerHeader(
            child: Text('RootNerd',
                style: TextStyle(
                  color: Color(0xFF99e265),
                  fontSize: 20,
                )),
          ),
          // CheckboxListTile(
          //     title: Text('#anime'),
          //     value: ,
          //     onChanged: (bool value) {
          //       setState(() {
          //       });
          //     }),
          ListTile(
            title: FlatButton(
                child: Text(
                  "Editar Perfil",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                onPressed: () {
                  //TODO: Salvar os dados do banco de dados (Firestone)
                  //TODO: Mostrar uma mensagem de sucesso.
                  Navigator.of(context).pushNamed('/perfil');
                }),
          ),
        ],
      )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ItemNerd(),
          ItemNerd(),
          ItemNerd(),
          ItemNerd(),
          ItemNerd(),
          ItemNerd(),
        ],
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
