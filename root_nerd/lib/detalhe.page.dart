import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Item Nerd",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFF99e265),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            width: double.infinity,
            child: Image.network(
                'https://via.placeholder.com/700x400.png?text=Image1',
                fit: BoxFit.cover),
          ),
          Text('One Piece - Ep.872'),
          Row(
            children: [
              Column(
                children: [
                  Text('#anime'),
                  Text('www.siteparaver.com'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.stars),
                  Text('1'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/comentario');
                },
                child: Column(
                  children: [
                    Icon(Icons.add_comment),
                    Text('1'),
                  ],
                ),
              ),
            ],
          ),
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
          Text('Avaliações de quem assistiu:'),
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
    );
  }
}
