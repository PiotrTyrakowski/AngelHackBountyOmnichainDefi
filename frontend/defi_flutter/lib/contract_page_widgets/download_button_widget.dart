import 'package:flutter/material.dart';

class DownloadButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, // TODO: implement download
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text('Download',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
    );
  }
}
