import 'package:flutter/material.dart';

class TabMyPage extends StatefulWidget {
  const TabMyPage({Key? key}) : super(key: key);

  @override
  State<TabMyPage> createState() => _TabMyPageState();
}

class _TabMyPageState extends State<TabMyPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('TabMyPage'));
  }
}
