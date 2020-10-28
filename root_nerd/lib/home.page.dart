// 1. IMPORTAR AS BIBLIOTECAS QUE UTILIZAREI NA TELA
// 2. CRIAR A CLASSE QUE HERDE DE **STATELESSWIDGET** OU STATEFULWIDGET
// 3. IMPLEMENTAR O MÉTODO BUILD DA CLASSE
// 4. RETORNAR O WIDGET QUE DESEJA MOSTRAR NA TELA DENTRO DO MÉTODO BUILD.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:root_nerd/itemnerd.widget.dart';
import 'package:root_nerd/models/itemnerd.model.dart';

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseFirestore database = FirebaseFirestore.instance;
  bool anime = false;
  bool filme = false;
  bool hq = false;
  bool desenho = false;
  bool manga = false;


  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text(
          "RootNerd - Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text('RootNerd',
                style: TextStyle(
                  color: Color(0xFF99e265),
                  fontSize: 20,
                )),
            SizedBox(
              height: 30,
            ),
            Text('Temas que quero ver:',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 20,
            ),
            CheckboxListTile(
                title: Text('#anime'),
                value: anime,
                onChanged: (value) {
                  setState(() {
                    anime = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
                title: Text('#filme'),
                value: filme,
                onChanged: (value) {
                  setState(() {
                    filme = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
                title: Text('#HQ'),
                value: hq,
                onChanged: (value) {
                  setState(() {
                    hq = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
                title: Text('#desenho'),
                value: desenho,
                onChanged: (value) {
                  setState(() {
                    desenho = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            CheckboxListTile(
                title: Text('#desenho'),
                value: manga,
                onChanged: (value) {
                  setState(() {
                    manga = value;
                  });
                }),
            SizedBox(
              height: 10,
            ),
            ListTile(
              title: FlatButton(
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Editar Perfil",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/perfil');
                  }),
            ),
          ],
        ),
      )),
      body: StreamBuilder<QuerySnapshot>(
        stream: database.collection('posts').orderBy('nome').snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              Item _itemnerd = Item.fromJson(snapshot.data.docs[index].id,
                  snapshot.data.docs[index].data());
              return ItemNerd(_scaffoldKey,_itemnerd);
            },
          );
        },
      ),
      //  ListView(
      //   scrollDirection: Axis.vertical,
      //   children: [
      //     ItemNerd(),
      //     ItemNerd(),
      //     ItemNerd(),
      //     ItemNerd(),
      //     ItemNerd(),
      //     ItemNerd(),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Novo Item Nerd",
        onPressed: () {
          Navigator.of(context).pushNamed('/cadastroPost');
        },
        backgroundColor: Color(0xFF99e265),
      ),
    );
  }
}
