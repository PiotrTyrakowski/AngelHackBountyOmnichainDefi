import 'package:defi_flutter/contract_page_widgets/arg_widget.dart';
import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:flutter/material.dart';

class MethodWidget extends StatelessWidget {
  final String _methodName;
  final List<(String, String)> _args;
  final VoidCallback? onClick;

  const MethodWidget({
    super.key,
    required String methodName,
    required List<(String, String)> args,
    this.onClick,
  })  : _methodName = methodName,
        _args = args;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Use all available horizontal space
      child: InkWell(
        onTap: onClick,
        child: Card.filled(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\"$_methodName\" method",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                ..._args
                    .map((arg) => ArgWidget(argName: arg.$1, argType: arg.$2))
                    .toList(),
                const SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(onPressed: () {}, child: Text("execute"))
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
