import 'package:flutter/material.dart';
import 'package:root_nerd/itemcomentario.widget.dart';
import 'package:root_nerd/models/itemcomentario.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComentarioPage extends StatelessWidget {
  FirebaseFirestore database = FirebaseFirestore.instance;
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
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    database.collection('posts').orderBy('nome').snapshots(),
                builder: (_, snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      Comentario itemcomentario =
                          Comentario.fromJson(snapshot.data.docs[index].data());
                      return ItemComentario(itemcomentario);
                    },
                  );
                },
              ),

              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //     ItemComentario(),
              //   ],
              // ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Digite aqui seu Comentário",
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'Campo obrigatório' : null,
                      autovalidate: false,
                    ),
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
