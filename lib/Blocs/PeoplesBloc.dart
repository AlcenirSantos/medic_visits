import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:lab_visitas/Validacao/Validations.dart';
import 'package:rxdart/rxdart.dart';

class PeoplesBloc extends BlocBase with Validations {
  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _documentController = BehaviorSubject<String>();
  final _clinicController = BehaviorSubject<String>();
  final _zipCodeController = BehaviorSubject<String>();

  Stream<String> get outName =>
      _nameController.stream.transform(validationName);
  Stream<String> get outEmail =>
      _emailController.stream.transform(validationEmail);
  Stream<String> get outDocument =>
      _documentController.stream.transform(validationDocument);
  Stream<String> get outClinic =>
      _clinicController.stream.transform(validationClinic);
  Stream<String> get outZipCode =>
      _zipCodeController.stream.transform(validationZipCode);

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeDocument => _documentController.sink.add;
  Function(String) get changeClinic => _clinicController.sink.add;
  Function(String) get changeZipCode => _zipCodeController.sink.add;

  PeoplesBloc() {}
  onSubmit() {}
  @override
  void dispose() {
    // will be called automatically
    _emailController.close();
    _nameController.close();
    _documentController.close();
  }
}
