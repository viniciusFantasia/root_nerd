import 'package:flutter/material.dart';

class ItemNerd extends StatelessWidget {
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
        decoration: BoxDecoration(
            color: Color(0xFF4F4F4F),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(4, 4),
                blurRadius: 12,
              ),
            ]),
        
        child: 
  
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children:[
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('One Piece - Ep.872'),
                Text('#anime'),
              ],
            ),
              ],
            ),
            SizedBox(height: 5),
            Image.network(
              'https://via.placeholder.com/700x250.png?text=Image1',
            ),
            SizedBox(height: 5),
            Text(
                'Que incrível a tecnologia usada nesse episódio, animação fluida e coreografia de luta impecável, amei demais, cada vez melhor!'),
            Text('www.siteparaver.com'),
            Divider(),
            GestureDetector(
              // onTap: () => Navigator.of(context).pushNamed('/cadastro'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:[
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://www.diariodepernambuco.com.br/static/app/noticia_127983242361/2019/12/03/812540/20191203093743682044o.jpg'),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "@Otaku",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "30/09/2020",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  Row(

                    children: [
                      Column(
                        children: [
                          Icon(Icons.stars),
                          Text('1'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.add_comment),
                          Text('2'),
                        ],
                      )
                    ],
                  )
                ],
                
                ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
