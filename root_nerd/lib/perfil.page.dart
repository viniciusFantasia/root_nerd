import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";


class PerfilPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    final String uid = ModalRoute.of(context).settings.arguments;
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _database.collection("perfis").doc(uid).get(),
        builder: (context, snapshot) {
          if(
            !snapshot.hasData) 
            return Center(
              child: CircularProgressIndicator()
              );
            final perfil = snapshot.data;
          return Container(
            width: larguraTela > 700 ? 400 : larguraTela,
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //Image.asset(
                  // '../img/home.png',
                  //width: 230,
                  //height: 230,
                  //),
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.brown[300],
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.diariodepernambuco.com.br/static/app/noticia_127983242361/2019/12/03/812540/20191203093743682044o.jpg'),
                      radius: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    perfil['nome'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      perfil['bio']),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 10,
                  ),
              
                
                  _auth.currentUser.uid != uid ? Container() : FlatButton(
                  child: Text(
                    "Editar Perfil",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF99e265),
                      decoration: TextDecoration.underline,
                    ),
                    
                  ),
                  
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      Navigator.of(context).pushNamed('/atualizarPerfil');
                    }
                  }
                  
                  ),
                  _auth.currentUser.uid != uid ? Container() : FlatButton(
                  child: Text(
                    "Editar Senha",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF99e265),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      
                      Navigator.of(context).pushNamed('/atualizarSenha');
                    }
                  }
                  ),           
                ],
              )
              ),
          );
        
        }
      ),
    );
  }
}
