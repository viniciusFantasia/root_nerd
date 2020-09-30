import 'package:flutter/material.dart';

class ItemComentario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/detalhe");
      },
      // onLongPress: () {
      //   Navigator.of(context).pushNamed("/cadastro");
      // },
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: EdgeInsets.all(8),
        //color: Colors.white,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(4, 4),
            blurRadius: 12,
          ),
        ]),
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      'https://www.diariodepernambuco.com.br/static/app/noticia_127983242361/2019/12/03/812540/20191203093743682044o.jpg'),
                ),
                Text('@user')
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text('Que massa esse anime, obrigado pela recomendação!')
          ],
        ),
      ),
    );
  }
}
