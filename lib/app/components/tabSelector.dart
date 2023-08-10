import 'package:flutter/material.dart';
import 'package:the_locator/config/app_router.dart';

class TabSelector extends StatefulWidget {
  // final TabSelectorBloc controller;
  List<String> options = [];

  @override
  TabSelector({Key? key, required this.options}) : super(key: key);
  void initState() {}

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  @override
  void initState() {
    mainPageBloc.onInit();
    super.initState();
  }

  Widget ClickableOption(String optionName) {
    return InkWell(
      child: Text(optionName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...widget.options
            .map<Widget>((option) => Text(
                  option,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ))
            .toList(),
      ],
    );
  }
}
