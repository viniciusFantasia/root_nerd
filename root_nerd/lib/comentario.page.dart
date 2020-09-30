import 'package:flutter/material.dart';
import 'package:root_nerd/itemcomentario.widget.dart';

class ComentarioPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RootNerd"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Text('Comentários'),
          ItemComentario(),
          ItemComentario(),
          ItemComentario(),
          ItemComentario(),
          ItemComentario(),
          ItemComentario(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Novo Comentário",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastroComentario');
        },
      ),
    );
  }
}
