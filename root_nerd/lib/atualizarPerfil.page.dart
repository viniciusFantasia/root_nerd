import "package:flutter/material.dart";

class AtualizarPerfilPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                    radius: 135,
                    backgroundColor: Colors.brown[300],
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.diariodepernambuco.com.br/static/app/noticia_127983242361/2019/12/03/812540/20191203093743682044o.jpg'),
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
                      labelText: "Alterar Usuário",
                    ),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
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
                      labelText: "Alterar Biografia",
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate())
                          Navigator.of(context).pushNamed('/perfil');
                      },
                      child: Text(
                        "Atualizar",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      color: Color(0xFF99e265),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
