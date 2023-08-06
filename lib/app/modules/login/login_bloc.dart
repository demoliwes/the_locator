import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Disposable {
  late FirebaseAuth authenticationInstance;

  @override
  void onInit() async {
    authenticationInstance = FirebaseAuth.instance;
  }

  final _emailController = BehaviorSubject<String?>.seeded('');
  final _passwordController = BehaviorSubject<String?>.seeded('');

  Stream<String?> get emailStream => _emailController.stream;
  Stream<String?> get passwordStream => _passwordController.stream;

  String? get email => _emailController.stream.value;
  String? get password => _passwordController.stream.value;

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String?) get changePassword => _passwordController.sink.add;

  Future<bool> emailAndPasswordRegistration(
      String email, String password) async {
    try {
      final teste = await authenticationInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> emailAndPasswordSignIn(String email, String password) async {
    try {
      final user = await authenticationInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isEmailValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }

  Future<bool> handleSubmit(bool isLogin) async {
    // if (formKey.currentState!.validate()) {

    if (isLogin) {
      return await emailAndPasswordSignIn(email!, password!);
    } else {
      return await emailAndPasswordRegistration(email!, password!);
    }
    // } else {
    //   return false;
    // }
  }

  @override
  void dispose() {
    // TODO: implement disposes
  }
}
