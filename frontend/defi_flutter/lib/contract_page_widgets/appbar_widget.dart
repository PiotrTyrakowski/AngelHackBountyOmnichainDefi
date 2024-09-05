import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      title: Text(title),
      backgroundColor: Colors.blue[200],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
