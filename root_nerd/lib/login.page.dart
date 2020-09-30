import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "Login",),
      ),
      body: Container(
         padding: EdgeInsets.all(10),
        color: Colors.black,
        child: Column( 
          
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('../img/home.png'),
            ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                ),            
              ), 
              ],
            ),
      ),
      );
  }
}