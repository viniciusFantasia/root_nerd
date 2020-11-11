import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:root_nerd/models/itemnerd.model.dart';

class EdicaoPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

FirebaseFirestore _database = FirebaseFirestore.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;
  String nome, referencia, descricao;

  Widget build(BuildContext context) {
    
    Item item = ModalRoute.of(context).settings.arguments;

    
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Post",
          style: TextStyle(
            color: Colors.black,
          ),
        ),

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
                    initialValue: item.nome,
                    decoration: InputDecoration(
                      labelText: "Nome",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    validator: (value) {
                    if (value.isEmpty) {
                      return "Campo obrigatório";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => nome = value,
                ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: item.referencia,
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
                    initialValue: item.descricao,
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
                      onPressed:() {
              if (formKey.currentState.validate()) {
                // invocar os métodos onSave de cada TextFormField:
                formKey.currentState.save();

                // ~ UPDATE Ofertas SET nome=, empresa=, preco=, descricao=.. WHERE id=...
                _database.collection('posts').doc(item.id).update({
                  "nome": nome,
                  "referencia": referencia,
                  "descricao": descricao
                });

                Navigator.of(context).pop();
              }
            },
                      child: Text(
                        "Salvar Alteração",
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
