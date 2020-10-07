import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate())
                          Navigator.of(context).pushNamed('/home');
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xFF99e265),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Não tem cadastro?",
                      style: TextStyle(
                          color: Colors.white,
                        ),),
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
