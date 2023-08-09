import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;
import 'package:go_router/go_router.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_locator/config/page_names.dart';

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

  Future<bool> emailAndPasswordSignIn() async {
    try {
      await authenticationInstance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      User? user = authenticationInstance.currentUser;

      if (user != null) {
        String? idToken = await user.getIdToken();
        if (idToken != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString('accessToken', idToken);
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  bool isEmailValid(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    return emailRegex.hasMatch(email);
  }

  void handleSubmit(BuildContext context) async {
    bool successfullLogin;
    if (email != null && password != null) {
      if (isEmailValid(email!)) {
        successfullLogin = await emailAndPasswordSignIn();
      } else {
        //TODO add invalid email exception
        successfullLogin = false;
      }
    } else {
      successfullLogin = false;
    }
    if (successfullLogin && context.mounted) {
      context.go(RouteNames.mainPage);
    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    // TODO: implement disposes
  }
}
