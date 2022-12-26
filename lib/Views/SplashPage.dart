import 'package:flutter/material.dart';
import 'package:lab_visitas/Blocs/LoginBloc.dart';
import 'package:lab_visitas/Model/UserModel.dart';
import 'package:lab_visitas/Views/HomePage.dart';
import 'package:scoped_model/scoped_model.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _loginBloc = LoginBloc();
  late String _cliente;
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScopedModelDescendant<UserModel>(
            builder: (
              context,
              child,
              model,
            ) {
              // _cliente = "${model.userData["Nome"]}";
              // _changeOpacity();
              return Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/logos/Logo_Brasao_Foreground.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 35,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                              image: AssetImage(
                                  'assets/logos/Logo_Brasao_Vetor.png'),
                              fit: BoxFit.fill,
                              height: 250,
                              width: 250,
                            ),
                          ],
                        ),
                      ),
                      // child: Text(_cliente),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            opacity: opacityLevel,
                            duration: Duration(seconds: 3),
                            child: Text(''),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();

    _loginBloc.outState.listen((state) {
      switch (state) {
        case LoginState.SUCCESS:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
        case LoginState.LOADING:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
        case LoginState.CADUSER:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
        case LoginState.FAIL:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
          break;
      }
    });
    // _changeOpacity();
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
