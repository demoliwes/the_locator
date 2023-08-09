import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_locator/config/page_names.dart';

import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc controller;

  @override
  LoginPage({Key? key, required this.controller}) : super(key: key);
  void initState() {
    controller.onInit();
  }

  // String email = '';
  // String password = '';
  bool isLogin = false;
  final _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  changeIsLogin() {
    isLogin = !isLogin;
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.onInit(); // Initialize the controller here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("The Locator", style: TextStyle(fontSize: 32)),
            Form(
                key: widget._formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        // controller: widget._emailController,
                        onChanged: widget.controller.changeEmail,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!widget.controller.isEmailValid(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        // controller: widget._passwordController,
                        onChanged: widget.controller.changePassword,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Your very secure password goes in here',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          widget.controller.handleSubmit(context);
                          // Handle the success value as needed
                        },
                        child: const Text('Log-in'),
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              context.go(RouteNames.register);
                            });
                          },
                          child: const Text(
                            'Register',
                          ))
                    ]))
          ],
        ),
      ),
    );
  }
}
