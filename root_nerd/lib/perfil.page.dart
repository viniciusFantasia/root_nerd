import "package:flutter/material.dart";
import 'package:root_nerd/itemcomentario.widget.dart';
import 'package:root_nerd/itemnerd.widget.dart';

class PerfilPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    double larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Perfil",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Row(
            children: [
              FlatButton(
                  child: Text(
                    "Editar Perfil",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      //TODO: Salvar os dados do banco de dados (Firestone)
                      //TODO: Mostrar uma mensagem de sucesso.
                      Navigator.of(context).pushNamed('/atualizarPerfil');
                    }
                  }),
              FlatButton(
                  child: Text(
                    "Editar Senha",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      //TODO: Salvar os dados do banco de dados (Firestone)
                      //TODO: Mostrar uma mensagem de sucesso.
                      Navigator.of(context).pushNamed('/atualizarSenha');
                    }
                  })
            ],
          ),
        ],
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: Container(
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
                '@Otaku',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI.'),
              SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 50,
              //   child: RaisedButton(
              //     onPressed: () {
              //       if (formKey.currentState.validate())
              //         Navigator.of(context).pushNamed('/atualizarPerfil');
              //     },
              //     child: Text(
              //       "Editar Perfil",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20),
              //     ),
              //     color: Color(0xFF99e265),
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 50,
              //   child: RaisedButton(
              //     onPressed: () {
              //       if (formKey.currentState.validate())
              //         Navigator.of(context).pushNamed('/atualizarSenha');
              //     },
              //     child: Text(
              //       "Atualizar Senha",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold,
              //           fontSize: 20),
              //     ),
              //     color: Color(0xFF99e265),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  // children: [
                  //   ItemComentario(),
                  //   ItemNerd(),
                  //   ItemComentario(),
                  //   ItemNerd(),
                  //   ItemComentario(),
                  //   ItemNerd(),
                  //   ItemComentario(),
                  //   ItemNerd(),
                  //   ItemComentario(),
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
