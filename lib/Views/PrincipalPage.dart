import 'package:flutter/material.dart';
import 'package:lab_visitas/Styles/Theme.dart';
import 'package:lab_visitas/Views/PeoplePage.dart';
import 'package:lab_visitas/Widgets/VisitsList.dart';

class PrincipalPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String nameUser;
  const PrincipalPage(
      {required this.scaffoldKey, required this.nameUser, super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: const BoxDecoration(
          color: mainBg,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.only(
                left: 15,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Ola,",
                        style: TextStyle(
                          color: primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.nameUser + "!",
                        style: const TextStyle(
                          color: primaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        color: Colors.white,
                        icon: const Icon(Icons.settings),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                    child: Text(
                      "Cadastros",
                      style: TextStyle(
                        color: primaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        width: 120,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(28, 58, 85, 1)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset('assets/Icons/visitas.png'),
                              ),
                              Text(
                                'Visita',
                                style: TextStyle(color: primaryText),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 120,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return PeoplePage();
                            }),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(28, 58, 85, 1)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Image.asset('assets/Icons/user.png'),
                              ),
                              Text(
                                'Pessoa',
                                style: TextStyle(color: primaryText),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 110, left: 10, right: 10),
        child: _visitList(context),
      ),
    ]);
  }
}

_visitList(BuildContext context) {
  return Container(
    margin:
        EdgeInsets.only(top: (MediaQuery.of(context).size.height / 3) / 1.82),
    height: (MediaQuery.of(context).size.height / 3) * 2,
    width: MediaQuery.of(context).size.width,
    child: VisitsList(),
  );
}
