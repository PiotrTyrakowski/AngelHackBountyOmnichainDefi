
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart'; // Dark theme
import 'package:flutter/services.dart'; // For clipboard functionality
import 'package:flutter_highlight/themes/github.dart'; 

class CodeDisplayWidget extends StatelessWidget {
  final String code;  // Pass the code you want to display

  CodeDisplayWidget({required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Contract code:",
            style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 16),
          HighlightView(
            code,
            language: 'solidity',  
            theme: githubTheme,  
            padding: const EdgeInsets.all(12),
            textStyle: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.copy, color: Colors.white),
              onPressed: () {
                // Copy the code to the clipboard
                // Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code copied to clipboard!')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}