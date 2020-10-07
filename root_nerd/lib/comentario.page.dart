import 'package:flutter/material.dart';
import 'package:root_nerd/itemcomentario.widget.dart';

class ComentarioPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Comentários",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                  ItemComentario(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        // TODO: Salvar os dados no banco de dados (Firestore)
                        // TODO: Mostrar uma mensagem de sucesso.
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
