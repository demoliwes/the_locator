import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;
import 'package:rxdart/rxdart.dart';

class MainPageBloc extends Disposable {
  late FirebaseAuth authenticationInstance;

  @override
  void onInit() async {}

  final _emailController = BehaviorSubject<String?>.seeded('');
  final _passwordController = BehaviorSubject<String?>.seeded('');

  Stream<String?> get emailStream => _emailController.stream;
  Stream<String?> get passwordStream => _passwordController.stream;

  String? get email => _emailController.stream.value;
  String? get password => _passwordController.stream.value;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String?) get changePassword => _passwordController.sink.add;

  @override
  void dispose() {}
}
