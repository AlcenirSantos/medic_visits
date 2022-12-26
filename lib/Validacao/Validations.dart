import 'dart:async';

class Validations {
  final validationEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (emailValid) {
      sink.add(email);
    } else {
      sink.addError("Insira um E-mail valido!");
    }
  });
  final validationName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 10 && name.contains(' ')) {
      sink.add(name);
    } else {
      sink.addError("O Nome Completo é obrigatorio");
    }
  });
  final validationClinic =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (value.isNotEmpty) {
      sink.add(value);
    } else {
      sink.addError("O Nome Completo é obrigatorio");
    }
  });
  final validationDocument = StreamTransformer<String, String>.fromHandlers(
      handleData: (document, sink) {
    var reg = RegExp('[^0-9]');
    var numDoc = document.replaceAll(reg, '');
    sink.add(document);
    if (numDoc.length == 11 || numDoc.length == 14) {
      sink.add(document);
    } else {
      sink.addError("O CPF/CNPJ Inválido");
    }
  });
  final validationZipCode =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    var reg = RegExp('[^0-9]');
    var numDoc = value.replaceAll(reg, '');
    if (numDoc.length == 8) {
      sink.add(value);
    } else {
      sink.addError("O CEP Inválido");
    }
  });
  final validaSenha =
      StreamTransformer<String, String>.fromHandlers(handleData: (senha, sink) {
    if (senha.length > 5) {
      sink.add(senha);
    } else {
      sink.addError("Senha Invalida");
    }
  });
  final validaSobreNome = StreamTransformer<String, String>.fromHandlers(
      handleData: (sobreNome, sink) {
    if (sobreNome.length != 0) {
      sink.add(sobreNome);
    } else {
      sink.addError("O Sobrenome é obrigatorio");
    }
  });

  final validaDtNascimento = StreamTransformer<String, String>.fromHandlers(
      handleData: (dtNascimento, sink) {
    if (dtNascimento.length != 0) {
      sink.add(dtNascimento);
    } else {
      sink.addError("A Data de Nascimento é obrigatorio");
    }
  });
  final validaCPF =
      StreamTransformer<String, String>.fromHandlers(handleData: (cpf, sink) {
    if (cpf.length != 0) {
      sink.add(cpf);
    } else {
      sink.addError("O CPF é obrigatorio");
    }
  });
  final validaCEP =
      StreamTransformer<String, String>.fromHandlers(handleData: (cep, sink) {
    if (cep.length != 0) {
      sink.add(cep);
    } else {
      sink.addError("O CEP é obrigatorio");
    }
  });
  final validaEstado = StreamTransformer<String, String>.fromHandlers(
      handleData: (estado, sink) {
    if (estado.length != 0) {
      sink.add(estado);
    } else {
      sink.addError("O Estado é obrigatorio");
    }
  });
  final validaCidade = StreamTransformer<String, String>.fromHandlers(
      handleData: (cidade, sink) {
    if (cidade.length != 0) {
      sink.add(cidade);
    } else {
      sink.addError("O Cidade é obrigatorio");
    }
  });
  final validaBairro = StreamTransformer<String, String>.fromHandlers(
      handleData: (bairro, sink) {
    if (bairro.length != 0) {
      sink.add(bairro);
    } else {
      sink.addError("O Bairro é obrigatorio");
    }
  });
  final validaRua =
      StreamTransformer<String, String>.fromHandlers(handleData: (rua, sink) {
    if (rua.length != 0) {
      sink.add(rua);
    } else {
      sink.addError("A Rua é obrigatorio");
    }
  });

  final validaConfirmaSenha = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirmaSenha, sink) {
    if (confirmaSenha.length > 5) {
      sink.add(confirmaSenha);
    } else {
      sink.addError("A confirmação de senha é obrigatorio");
    }
  });
  final validaTelefone = StreamTransformer<String, String>.fromHandlers(
      handleData: (telefone, sink) {
    if (telefone.length > 5) {
      sink.add(telefone);
    } else {
      sink.addError("O telefone é obrigatorio");
    }
  });
  final validaSexo =
      StreamTransformer<String, String>.fromHandlers(handleData: (sexo, sink) {
    if (sexo.contains("-1")) {
      sink.addError("Escolha o Sexo");
    } else {
      sink.add(sexo);
    }
  });
}
