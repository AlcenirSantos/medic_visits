import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lab_visitas/Blocs/PeoplesBloc.dart';
import 'package:lab_visitas/Widgets/InputField.dart';

class ModalAddress extends StatefulWidget {
  const ModalAddress({super.key});

  @override
  State<ModalAddress> createState() => _ModalAddressState();
}

class _ModalAddressState extends State<ModalAddress> {
  final _peoplesBloc = PeoplesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InputField(
                  hint: 'CEP',
                  keyBoard: TextInputType.number,
                  onChanged: _peoplesBloc.changeZipCode,
                  stream: _peoplesBloc.outZipCode,
                  textInputAction: TextInputAction.next,
                  maskedTextController:
                      MaskedTextController(mask: '00.000-000'),
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  hint: 'Cidade',
                  keyBoard: TextInputType.text,
                  onChanged: _peoplesBloc.changeZipCode,
                  stream: _peoplesBloc.outZipCode,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  hint: 'Bairro',
                  keyBoard: TextInputType.text,
                  onChanged: _peoplesBloc.changeZipCode,
                  stream: _peoplesBloc.outZipCode,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  hint: 'Rua',
                  keyBoard: TextInputType.text,
                  onChanged: _peoplesBloc.changeZipCode,
                  stream: _peoplesBloc.outZipCode,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                InputField(
                  hint: 'Numero',
                  keyBoard: TextInputType.text,
                  onChanged: _peoplesBloc.changeZipCode,
                  stream: _peoplesBloc.outZipCode,
                  textInputAction: TextInputAction.next,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
