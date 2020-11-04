import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class CadastroUserPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String nome, email, senha;

  var _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String exibeErroEmPortugues(String code) {
    switch (code) {
      case "email-already-in-use":
        return "Já existe um usuário com este e-mail.";
      case "invalid-email":
        return "E-mail inválido.";
      case "operation-not-allowed":
        return "Operação não permitida. Verifique com o admin.";
      case "weak-password":
        return "Senha fraca. Refaça.";
      default:
        return "Ops, aconteceu um erro.";
    }
  }

  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: larguraTela > 700 ? 400 : larguraTela,
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //Image.asset(
                  // '../img/home.png',
                  //width: 230,
                  //height: 230,
                  //),
                  CircleAvatar(
                    radius: 135,
                    backgroundColor: Colors.brown[300],
                    child: CircleAvatar(
                      backgroundImage: AssetImage('../img/home.png'),
                      radius: 130,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Clique para alterar sua foto',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 16,
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
                      labelText: "E-mail",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                     onSaved: (value) => email = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                     onSaved: (value) => senha = value,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                        onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            var credentials =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: senha);
                            await credentials.user
                                .updateProfile(displayName: nome);
                            Navigator.of(context).pushNamed('/home');
                          } on FirebaseAuthException catch (ex) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(exibeErroEmPortugues(ex.code)),
                            ));
                          }
                        }
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      color: Color(0xFF99e265),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/');
                        },
                        child: Text(
                          "Clique aqui.",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
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
