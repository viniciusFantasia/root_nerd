import 'package:flutter/material.dart';

class DetalhePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(
            'https://via.placeholder.com/700x400.png?text=Image1',
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
                  Icon(Icons.add),
                  Text('1'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.add),
                  Text('1'),
                ],
              ),
            ],
          ),
          Text(
              'Que incrível a tecnologia usada nesse episódio, animação fluida e coreografia de luta impecável, amei demais, cada vez melhor!'),
          Text('Avaliações de quem assistiu:'),
          Text('rating interativo'),
          Icon(Icons.add)
        ],
      ),
    );
  }
}
