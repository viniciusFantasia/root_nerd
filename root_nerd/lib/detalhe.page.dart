import 'package:flutter/material.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Item Nerd"),
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
          Text('One Piece - Ep.872',
              style: TextStyle(
                color: Colors.white,
              )),
          Row(
            children: [
              Column(
                children: [
                  Text('#anime',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  Text('www.siteparaver.com',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text('1',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text('1',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ],
              ),
            ],
          ),
          Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
              style: TextStyle(
                color: Colors.white,
              )),
          Text('Avaliações de quem assistiu:',
              style: TextStyle(
                color: Colors.white,
              )),
          Text('rating interativo',
              style: TextStyle(
                color: Colors.white,
              )),
          Icon(Icons.add)
        ],
      ),
    );
  }
}
