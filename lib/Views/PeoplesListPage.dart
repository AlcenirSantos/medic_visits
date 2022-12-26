import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_visitas/Widgets/ButtonReturn.dart';
import 'package:lab_visitas/Widgets/PeoplesList.dart';

class PeoplesListPage extends StatefulWidget {
  const PeoplesListPage({super.key});

  @override
  State<PeoplesListPage> createState() => _PeoplesListPageState();
}

class _PeoplesListPageState extends State<PeoplesListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      color: Color.fromRGBO(245, 250, 255, 1),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          ButtonReturn(titleButton: 'Pesquisar Pessoas'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Procurar',
                  ),
                ),
              )
            ],
          ),
          _peoplesList(context)
        ],
      ),
    );
  }
}

_peoplesList(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(left: 10, right: 10),
    height: (MediaQuery.of(context).size.height / 3) * 2,
    width: MediaQuery.of(context).size.width,
    child: PeoplesList(),
  );
}
