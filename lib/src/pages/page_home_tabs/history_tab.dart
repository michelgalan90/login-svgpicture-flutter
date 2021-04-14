import 'package:flutter/material.dart';

class HistoryTab extends StatefulWidget {
  @override
  _HistoryTabState createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    print('historial');
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.blue,
          height: constraints.maxHeight /3,
          width: constraints.maxWidth /2,
        );
      },
    );
  }
}
