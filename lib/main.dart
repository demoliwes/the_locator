import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app/modules/login/login_bloc.dart';
import 'app/modules/login/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginBloc loginBloc = LoginBloc();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(controller: loginBloc),
    );
  }
}
