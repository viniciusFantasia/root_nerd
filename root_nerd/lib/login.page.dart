import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Login",)
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: Column( 
          
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('../img/home.png'),
            ),
            ],
            ),
      ),
      );
  }
}