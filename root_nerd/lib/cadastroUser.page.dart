import "package:flutter/material.dart";

class CadastroUserPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Cadastro de Usuário",
      )),
      body: Container(
        child: Column(
          children: [
            Image.asset('../img/home.png'),
          ],
        ),
      ),
    );
  }
}
