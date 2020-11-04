import 'package:cloud_firestore/cloud_firestore.dart';

class Comentario {
  String mensagem;
  String uid;
  Timestamp data;
  String get strData =>
      "${data.toDate().day}/${data.toDate().month}/${data.toDate().year}";

  Comentario({
    this.mensagem,
    this.uid,
    this.data,
  });

  Comentario.fromJson(Map<String, dynamic> json) {
    this.mensagem = json['mensagem'] ?? '';
    this.uid = json['uid'] ?? '';
    this.data = json['data'];
    // this.likes = json['likes'] != null ? json['likes'] : 0; // if ternário
  }
}
