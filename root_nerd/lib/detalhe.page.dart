import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:root_nerd/models/itemnerd.model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalhePage extends StatelessWidget {
  FirebaseFirestore _database = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final String _id = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Item Nerd",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: _database.collection('posts').doc(_id).get(),   
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            final Item _itemnerd =
                Item.fromJson(snapshot.data.id, snapshot.data.data());
   
      return Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.network(
                'https://via.placeholder.com/700x400.png?text=Image1',
                fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  _itemnerd.nome,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _itemnerd.hashtag,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF99e265),
                          ),
                        ),
                        Text(
                          _itemnerd.referencia,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.stars,
                              size: 30,
                            ),
                            Text(
                              _itemnerd.likes.toString()
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
                              Text('1'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  _itemnerd.descricao,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Avaliações de quem assistiu:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SmoothStarRating(
                    allowHalfRating: false,
                    onRated: (v) {},
                    starCount: 5,
                    rating: 3,
                    defaultIconData: Icons.star_border,
                    size: 40.0,
                    isReadOnly: false,
                    color: Color(0xFF99e265),
                    borderColor: Color(0xFF99e265),
                    spacing: 0.0)
              ],
            ),
          ),
        ],
      );
          }),
    );
  }
}
