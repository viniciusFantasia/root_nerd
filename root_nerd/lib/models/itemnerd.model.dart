import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String nome;
  String referencia;
  String uid;
  double avaliacao;
  int likes;
  String descricao;
  String hashtag;
  Timestamp data;
  String get strData =>
      "${data.toDate().day}/${data.toDate().month}/${data.toDate().year}";
      String nomeUsuario;

  Item(
      {this.id,
      this.nome,
      this.referencia,
      this.uid,
      this.avaliacao,
      this.likes,
      this.descricao,
      this.hashtag,
      this.data});

  Item.fromJson(String id, Map<String, dynamic> json) {
    this.id = id;
    this.nome = json['nome'];
    this.referencia = json['referencia'];
    this.uid = json['uid'];
    this.avaliacao = json['avaliacao'];
    this.descricao = json['descricao'];
    this.likes = json['likes'] ?? 0;
    this.hashtag = json['hashtag'];
    this.data = json['data'];
    this.nomeUsuario = json['nomeUsuario'] ?? '';
    // this.likes = json['likes'] != null ? json['likes'] : 0; // if ternário
  }
}
