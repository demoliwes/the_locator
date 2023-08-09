import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:the_locator/config/page_names.dart';

class RegisterBloc extends Disposable {
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

  Future<bool> emailAndPasswordRegistration() async {
    try {
      await authenticationInstance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool isEmailValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }

  void handleSubmit(BuildContext context) async {
    //TODO create password and email regex verification
    bool successfullLogin;
    if (email != null && password != null) {
      successfullLogin = await emailAndPasswordRegistration();
    } else {
      successfullLogin = false;
    }
    if (successfullLogin && context.mounted) {
      context.go(RouteNames.loginPage);
    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
