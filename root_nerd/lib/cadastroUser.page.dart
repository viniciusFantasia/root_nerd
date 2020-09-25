import "package:flutter/material.dart";

class CadastroUserPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro de Usuário",
          textAlign: TextAlign.center,
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
        margin: EdgeInsets.all(20),
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
              Text('Clique para alterar sua foto'),
              SizedBox(
                height: 30,
              ),
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
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
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
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Campo obrigatório' : null,
                autovalidate: false,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Já tem uma conta?',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Clique aqui',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
