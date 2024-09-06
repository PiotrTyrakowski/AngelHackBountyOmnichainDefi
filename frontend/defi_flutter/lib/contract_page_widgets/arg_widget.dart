import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:flutter/material.dart';

class ArgWidget extends StatelessWidget {
  final String argName;
  final String argType;

  const ArgWidget({
    super.key,
    required this.argName,
    required this.argType,
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
              style: TextStyle(fontSize: 16), // Optional: adjust text style
            )),
          ),
          Expanded(
            flex: 5,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: argType,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8)
    ]);
  }
}
