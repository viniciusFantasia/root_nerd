import "package:flutter/material.dart";

class CadastroUserPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
        title: Text(
          "Cadastro de Usuário",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.save),
        //       onPressed: () {
        //         if (formKey.currentState.validate()) {
        //           //TODO: Salvar os dados do banco de dados (Firestone)
        //           //TODO: Mostrar uma mensagem de sucesso.
        //           Navigator.of(context).pop();
        //         }
        //       })
        // ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
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
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Senha",
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate())
                      Navigator.of(context).pushNamed('/home');
                  },
                  child: Text(
                    "Finalizar",
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
    );
  }
}
