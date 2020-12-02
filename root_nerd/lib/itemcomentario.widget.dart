import 'package:flutter/material.dart';
import 'package:root_nerd/models/itemcomentario.model.dart';

class ItemComentario extends StatelessWidget {
  final Comentario itemcomentario;

  ItemComentario(this.itemcomentario);
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
        decoration: BoxDecoration(color: Color(0xFF4F4F4F), boxShadow: [
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/perfil');
                  },
                  child: Text(
                    itemcomentario.nome,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF99e265),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                itemcomentario.mensagem,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
