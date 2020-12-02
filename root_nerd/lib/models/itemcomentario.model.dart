import 'package:cloud_firestore/cloud_firestore.dart';

class Comentario {
  String mensagem;
  String uid;
  Timestamp data;
  String nome;
  String get strData =>
      "${data.toDate().day}/${data.toDate().month}/${data.toDate().year}";

  Comentario({
    this.mensagem,
    this.uid,
    this.data,
    this.nome,
  });

  Comentario.fromJson(Map<String, dynamic> json) {
    this.mensagem = json['mensagem'] ?? '';
    this.uid = json['uid'] ?? '';
    this.data = json['data'];
    this.nome = json['nome'] ?? '';
    // this.likes = json['likes'] != null ? json['likes'] : 0; // if ternário
  }
}
