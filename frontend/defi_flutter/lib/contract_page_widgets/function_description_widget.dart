import 'package:flutter/material.dart';

class FunctionDescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.add_circle_outline, color: Colors.grey),
      title: Text(
        'Function',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Description duis aute irure dolor in reprehenderit in voluptate velit.',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
