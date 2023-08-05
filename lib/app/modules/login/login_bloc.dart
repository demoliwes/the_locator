import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' show Disposable;

class LoginBloc extends Disposable {
  late FirebaseAuth authenticationInstance;

  void onInit() async {
    authenticationInstance = FirebaseAuth.instance;
  }

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

  Future<bool> handleSubmit(
      GlobalKey<FormState> formKey,
      TextEditingController emailController,
      TextEditingController passwordController,
      bool isLogin) async {
    if (formKey.currentState!.validate()) {
      final email = emailController.value.text;
      final password = passwordController.value.text;
      if (isLogin) {
        return await emailAndPasswordSignIn(email, password);
      } else {
        return await emailAndPasswordRegistration(email, password);
      }
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement disposes
  }
}
