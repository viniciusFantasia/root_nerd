import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class CadastroPostPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

FirebaseFirestore _database = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
  String nome, referencia, descricao;

  Widget build(BuildContext context) {
    
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nova Publicação",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          FlatButton(
              child: Text(
                "Rascunho",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onPressed: () async {
                
              })
        ],
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: larguraTela > 700 ? 400 : larguraTela,
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.network(
                      'https://via.placeholder.com/300x200.png?text=Image1'),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Upload de Imagem',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nome",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                    onSaved: (value) => nome = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Referência",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                    onSaved: (value) => referencia = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Escreva uma Descrição",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    minLines: 1,
                    maxLines: 5,
                    maxLength: 200,
                    enabled: true,
                    keyboardType: TextInputType.multiline,
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                    onSaved: (value) => descricao = value,
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                  //TODO: Salvar os dados do banco de dados (Firestone)
                  formKey.currentState.save();
                  User user = _auth.currentUser;
                  await _database.collection('posts').add({'nome': nome, 'referencia': referencia, 'descricao': descricao, 'likes': 0, 'avaliacao': 0, 'data': DateTime.now(), 'hashtag': 'usahuas', "uid": user.uid, "nomeUsuario": user.displayName });

                  //TODO: Mostrar uma mensagem de sucesso.
                  Navigator.of(context).pop();
                }
                      },
                      child: Text(
                        "Compartilhar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      color: Color(0xFF99e265),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
