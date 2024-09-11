import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: Colors.black87,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
