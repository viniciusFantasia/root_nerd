import 'package:flutter/material.dart';
import 'package:root_nerd/models/itemnerd.model.dart';

class ItemNerd extends StatelessWidget {
  final Item itemnerd;

  ItemNerd(this.itemnerd);

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

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemnerd.nome,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      itemnerd.hashtag,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF99e265),
                      ),
                    ),
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
              itemnerd.descricao,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              itemnerd.referencia,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Divider(),
            GestureDetector(
              // onTap: () => Navigator.of(context).pushNamed('/cadastro'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/perfil');
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              'https://www.diariodepernambuco.com.br/static/app/noticia_127983242361/2019/12/03/812540/20191203093743682044o.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/perfil');
                            },
                            child: Text(
                              "@Otaku",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            itemnerd.strData,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
                              Icon(
                                Icons.stars,
                                size: 30,
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/comentario');
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.add_comment,
                                  size: 30,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
