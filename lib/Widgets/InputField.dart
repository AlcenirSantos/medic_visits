import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:lab_visitas/Styles/Theme.dart';

class InputField extends StatefulWidget {
  final IconData? icon;
  final String? hint;
  final bool? obscure;
  final TextInputType? keyBoard;
  final TextInputAction? textInputAction;
  final Stream<String>? stream;
  final Function(String)? onChanged;
  final MaskedTextController? maskedTextController;

  final Function? onExec;
  const InputField(
      {this.icon,
      this.hint = '',
      this.obscure = false,
      this.keyBoard,
      this.textInputAction,
      this.stream,
      this.onChanged,
      this.maskedTextController,
      Function? this.onExec,
      super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (widget.onExec != null) {
            widget.onExec!();
            print(snapshot.data);
          }
        }
        return TextField(
          onChanged: widget.onChanged,
          controller: widget.maskedTextController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            label: Text(widget.hint!),
            errorText: snapshot.hasError ? snapshot.error.toString() : null,
          ),
          style: TextStyle(color: mainBg),
          keyboardType: widget.keyBoard,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscure!,
        );
      },
    );
  }
}
