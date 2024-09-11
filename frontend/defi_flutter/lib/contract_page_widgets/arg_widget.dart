import 'package:flutter/material.dart';

class ArgWidget extends StatelessWidget {
  final String argName;
  final String argType;
  final TextEditingController controller;

  const ArgWidget({
    super.key,
    required this.argName,
    required this.argType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
                child: Text(
              "$argName:",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black), // Black border outline
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Black border when enabled
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Black border when focused
                ),
                labelText: argType,
                filled: true,
                fillColor:
                    Colors.white, // White background inside the TextField
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8)
    ]);
  }
}
