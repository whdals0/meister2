import 'package:flutter/material.dart';

class TabAlert extends StatefulWidget {
  const TabAlert({Key? key}) : super(key: key);

  @override
  State<TabAlert> createState() => _TabAlertState();
}

class _TabAlertState extends State<TabAlert> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('TabAlert'));
  }
}
