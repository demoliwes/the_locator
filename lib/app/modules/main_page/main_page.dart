import 'package:flutter/material.dart';

import 'main_page_bloc.dart';

class MainPage extends StatefulWidget {
  final MainPageBloc controller;

  @override
  MainPage({Key? key, required this.controller}) : super(key: key);
  void initState() {
    controller.onInit();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 8),
        child: Text('ea'),
      ),
    );
  }
}
