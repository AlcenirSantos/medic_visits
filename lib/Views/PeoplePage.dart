import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lab_visitas/Blocs/PeoplesBloc.dart';
import 'package:lab_visitas/Styles/Theme.dart';
import 'package:lab_visitas/Widgets/ButtonReturn.dart';
import 'package:lab_visitas/Widgets/InputField.dart';
import 'package:lab_visitas/Widgets/ModalAddress.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final _peoplesBloc = PeoplesBloc();

  final _formKey = GlobalKey<FormState>();

  _openTransactionFormModal(BuildContext context) {
    showBarModalBottomSheet(
        context: context,
        builder: (_) {
          return ModalAddress();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      ButtonReturn(titleButton: 'Cadastro de Pessoas'),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FittedBox(
                        child: Text(
                          'Os campos que contem (*) são obrigatórios para\nestar realizando o cadastro de pessoas',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  children: [
                    InputField(
                      hint: 'Nome',
                      keyBoard: TextInputType.text,
                      onChanged: _peoplesBloc.changeName,
                      stream: _peoplesBloc.outName,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      hint: 'E-mail',
                      keyBoard: TextInputType.emailAddress,
                      onChanged: _peoplesBloc.changeEmail,
                      stream: _peoplesBloc.outEmail,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      hint: 'CPF/CNPJ',
                      keyBoard: TextInputType.number,
                      onChanged: _peoplesBloc.changeDocument,
                      stream: _peoplesBloc.outDocument,
                      textInputAction: TextInputAction.next,
                      maskedTextController:
                          MaskedTextController(mask: '000.000.000-00'),
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      hint: 'Clínica',
                      keyBoard: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onChanged: _peoplesBloc.changeClinic,
                      stream: _peoplesBloc.outClinic,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(34, 171, 56, 1),
                        ),
                        onPressed: () {
                          _openTransactionFormModal(context);
                        },
                        child: const Text(
                          'Adicionar Endereço',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(34, 171, 56, 1),
                          ),
                          onPressed: () {
                            _peoplesBloc.changeClinic;
                          },
                          child: const Text(
                            'Gravar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
