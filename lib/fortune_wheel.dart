import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Fortune extends StatefulWidget {
  @override
  _FortuneState createState() => _FortuneState();
}

class _FortuneState extends State<Fortune> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Iron Man',
      'Captain America',
      'Thor',
      'Hulk',
      'Captain Marvel',
      'Black Panther',
      'Dr. Strange',
      'Spider Man',
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Fortune Wheel'),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              selected.add(1);
            });
          },
          child: Column(
            children: [
              Expanded(
                child: FortuneWheel(
                  physics: CircularPanPhysics(
                    duration: Duration(seconds: 1),
                    curve: Curves.decelerate,
                  ),
                  onFling: () {
                    selected.add(1);
                  },
                  selected: selected.stream,
                  items: [
                    for (var it in items) FortuneItem(child: Text(it)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
