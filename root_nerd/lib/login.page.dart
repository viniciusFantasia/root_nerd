import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _formKey = GlobalKey<FormState>();
  var _scaffolKey = GlobalKey<ScaffoldState>();

  String email, senha;

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffolKey,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: larguraTela > 700 ? 400 : larguraTela,
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('../img/home.png'),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      //focusedBorder: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    validator: (value) =>
                        value.isEmpty ? 'Campo obrigatório' : null,
                    autovalidate: false,
                    onSaved: (value) => email = value,
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Campo obrigatório" : null,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      //focusedBorder: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    obscureText: true,
                    onSaved: (value) => senha = value,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          try {
                            await _auth.signInWithEmailAndPassword(
                                email: email, password: senha);
                            Navigator.of(context).pushNamed('/home');
                          } on FirebaseAuthException catch (ex) {
                            _scaffolKey.currentState.showSnackBar(
                              SnackBar(
                                content: Text(ex.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      color: Color(0xFF99e265),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Não tem cadastro?",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cadastroUser');
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
