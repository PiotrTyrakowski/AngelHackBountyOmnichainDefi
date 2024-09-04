import 'package:flutter/material.dart';

class FunctionAreaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '[function return value] [Function Name]([function arg 1, function arg 2, ..., function arg n])',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text('arg 1:'),
        Text('arg 2:...'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {}, // TODO: implement
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text('Execute',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      ],
    );
  }
}
