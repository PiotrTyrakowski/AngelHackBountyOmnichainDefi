import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Available Functions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        // Icon(Icons.arrow_forward),
      ],
    );
  }
}
