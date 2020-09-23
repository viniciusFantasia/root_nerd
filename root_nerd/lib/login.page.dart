import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Login",)
      ),
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