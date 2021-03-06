import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:root_nerd/models/itemnerd.model.dart';

class ItemNerd extends StatelessWidget {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final Item itemnerd;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ItemNerd(this.scaffoldKey, this.itemnerd);

  void confirmaExclusao(BuildContext context, String id) {
    final _dialog = AlertDialog(
      title: Text("Confirma a exclusão?"),
      actions: [
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        RaisedButton(
          color: Colors.red,
          child: Text(
            "Confirmar",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            // ~ DELETE FROM Ofertas WHERE id = <123>
            _database.collection('posts').doc(itemnerd.id).delete();
            Navigator.of(context).pop();
          },
        )
      ],
    );
    showDialog(context: context, child: _dialog);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/detalhe", arguments: itemnerd.id);
      },
      onLongPress: () {
        if (_auth.currentUser.uid == itemnerd.uid) {
          scaffoldKey.currentState.showBottomSheet(
            (context) => Container(
              height: 180,
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Editar"),
                    leading: Icon(Icons.edit, color: Color(0xFF99e265)),
                  
                    onTap: () async {
                      await Navigator.of(context)
                          .pushNamed("/edicao", arguments: itemnerd);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: Text("Apagar"),
                    leading: Icon(Icons.delete, color: Color(0xFF99e265)),
                    onTap: () => confirmaExclusao(context, itemnerd.id),
                    ),
                  
                  ListTile(
                    title:
                        Text("Cancelar", style: TextStyle(color: Color(0xFF99e265))),
                    // leading: Icon(Icons.delete, color: Colors.red),
                    onTap: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          );
        }
      },
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
                          Navigator.of(context).pushNamed('/perfil', arguments: itemnerd.uid);
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
                              itemnerd.nomeUsuario,
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
                                itemnerd.likes.toString(),
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
                              Navigator.of(context).pushNamed('/comentario', arguments: itemnerd.id);
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
