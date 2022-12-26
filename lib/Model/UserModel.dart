import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class UserModel extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _usuarioLogado();
  }

  void recuperarSenha(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  Future<Null> _usuarioLogado() async {
    User? firebaseUser = await _auth.currentUser;
    if (firebaseUser != null) {
      if (userData["Nome"] == null) {
        await FirebaseFirestore.instance
            .collection("Usuarios")
            .doc(firebaseUser.uid)
            .get()
            .then((value) {
          userData = value.data()!;
        });
      }
      notifyListeners();
    }
  }
}
