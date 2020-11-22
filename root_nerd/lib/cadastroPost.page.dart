import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class CadastroPostPage extends StatefulWidget {
  @override
  _CadastroPostPageState createState() => _CadastroPostPageState();
}

class _CadastroPostPageState extends State<CadastroPostPage> {
  var formKey = GlobalKey<FormState>();

FirebaseFirestore _database = FirebaseFirestore.instance;

final FirebaseAuth _auth = FirebaseAuth.instance;

  String nome, hashtag, referencia, descricao, dropdownValue;

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
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Título",
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
                                    
                  DropdownButtonFormField<String>(
                  value: dropdownValue,
                  hint: Text("Categoria"),
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  onSaved: (value) => hashtag = value,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['#Anime', '#Filme', '#Série', '#HQ', '#Desenho', '#Jogo', '#Outro']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                    height: 10,
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
                  await _database.collection('posts').add({'nome': nome, 'referencia': referencia, 'descricao': descricao, 'likes': 0, 'avaliacao': 0, 'data': DateTime.now(), 'hashtag': hashtag, "uid": user.uid, "nomeUsuario": user.displayName });

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
