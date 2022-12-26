import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_visitas/Styles/Theme.dart';
import 'package:lab_visitas/Views/PeoplesListPage.dart';
import 'package:lab_visitas/Views/PrincipalPage.dart';
import 'package:lab_visitas/Views/VisitsListPage.dart';
import 'package:lab_visitas/Widgets/VisitsList.dart';
import 'package:lab_visitas/Widgets/MenuLateral.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String nameUser = "Igor Colodetti";
  int _selectedIndex = 0;
  _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = <Widget>[
      PrincipalPage(scaffoldKey: _scaffoldKey, nameUser: nameUser),
      PeoplesListPage(),
      VisitsListPage()
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuLateral(),
      backgroundColor: const Color.fromRGBO(245, 250, 255, 1),
      body: _widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(76, 139, 125, 1),
        unselectedItemColor: Colors.white,
        backgroundColor: mainBg,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: ImageIcon(AssetImage('assets/Icons/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/add-user.png')),
            label: 'Pessoa',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/Icons/edit-visit.png')),
            label: 'Visita',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
      ),
    );
  }
}
