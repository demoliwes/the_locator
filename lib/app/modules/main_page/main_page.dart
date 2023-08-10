import 'package:flutter/material.dart';
import 'package:the_locator/app/components/tabSelector.dart';
import 'package:the_locator/config/app_router.dart';

import 'main_page_bloc.dart';

class MainPage extends StatefulWidget {
  final MainPageBloc controller;

  @override
  const MainPage({Key? key, required this.controller}) : super(key: key);
  void initState() {
    controller.onInit();
  }

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    mainPageBloc.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 56,
        ),
        TabSelector(
          options: const ['Thiago', 'Reinaldo'],
        )
      ]),
    );
  }
}
