import 'package:flutter/material.dart';

class CircularWidget extends StatelessWidget {
  const CircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black54,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
