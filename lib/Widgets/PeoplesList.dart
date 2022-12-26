import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab_visitas/Widgets/CardPeople.dart';
import 'package:lab_visitas/Widgets/CardVisits.dart';

class PeoplesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      /* ## Recebendo os icones dos produtos do Firebase ## */
      future: FirebaseFirestore.instance.collection("peoples").get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView(
            children: documents.map((doc) => CardPeople(doc)).toList(),
          );
        } else {
          return Text('Its Error!');
        }
      },
    );
  }
}
