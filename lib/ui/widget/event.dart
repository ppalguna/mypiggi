import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  final child;
  const Event({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10), )
      ),
      child: child,
    );
  }
}