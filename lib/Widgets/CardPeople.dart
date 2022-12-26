import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab_visitas/Styles/Theme.dart';
import 'package:lab_visitas/Views/PeoplesListPage.dart';
import 'package:lab_visitas/Views/VisitPage.dart';
import 'package:lab_visitas/Widgets/VisitsList.dart';

class CardPeople extends StatelessWidget {
  final DocumentSnapshot snapshot;
  CardPeople(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return PeoplesListPage();
                // return DetalhesSaloes(snapshot, idSalao);
              },
            ),
          ), // Chamar a tela de Detalhes
          child: Stack(
            children: <Widget>[
              Container(
                height: 125,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      255, 255, 255, 1), //Painel de Fundo dos salões,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: Color.fromRGBO(77, 126, 171, 1), width: 1.5),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                    8,
                    8,
                    8,
                    8,
                  ),
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot['name'],
                        style: textocabecalhoStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        snapshot['email'],
                        style: textoNormalStyle(),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 180,
                            child: FittedBox(
                              child: Text(
                                'Prefeitura de Colatina Av. Angelo Giuberti, 343\nEsplanada COLATINA - ES, 29702-902 ',
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(120, 40),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(255, 203, 119, 1)),
                            ),
                            child: Text(
                              'Editar Dados',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _valoresSaloes({String? value, String? image}) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            image!,
            height: 12.0,
            color: Colors.white,
          ),
          Container(width: 8.0),
          Text(
            value!,
            style: textoNormalStyle(),
          ),
        ],
      ),
    );
  }
}

TextStyle textoNormalStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromRGBO(31, 78, 121, 1),
      fontWeight: FontWeight.w400,
      fontSize: 12.0);
}

TextStyle textocabecalhoStyle() {
  return TextStyle(
      fontFamily: 'Poppins',
      color: Color.fromRGBO(31, 78, 121, 1),
      fontSize: 17.0,
      fontWeight: FontWeight.w600);
}
