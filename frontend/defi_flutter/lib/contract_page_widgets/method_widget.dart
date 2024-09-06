import 'package:flutter/material.dart';
import 'package:defi_flutter/contract_page_widgets/arg_widget.dart';

class MethodWidget extends StatefulWidget {
  final String _methodName;
  final List<(String, String)> _args;
  final VoidCallback? onClick;
  final Function(List<String>)? onExecute;

  const MethodWidget({
    Key? key,
    required String methodName,
    required List<(String, String)> args,
    this.onClick,
    this.onExecute,
  })  : _methodName = methodName,
        _args = args,
        super(key: key);

  @override
  State<MethodWidget> createState() => _MethodWidgetState();
}

class _MethodWidgetState extends State<MethodWidget> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers.addAll(
      List.generate(widget._args.length, (_) => TextEditingController()),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  List<String>? executeMethodWrapper() {
    List<String> inputs = _controllers.map((controller) => controller.text.trim()).toList();
    
    // Check for empty inputs
    if (inputs.any((input) => input.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled')),
      );
      return null;
    }
    
    for (var str in inputs)
    {
      print(str);
    }

    return inputs;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: widget.onClick,
        child: Card.filled(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\"${widget._methodName}\" method",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...List.generate(
                  widget._args.length,
                  (index) => ArgWidget(
                    argName: widget._args[index].$1,
                    argType: widget._args[index].$2,
                    controller: _controllers[index],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final inputs = executeMethodWrapper();
                        if (inputs != null && widget.onExecute != null) {
                          widget.onExecute!(inputs);
                        }
                      },
                      child: const Text("Execute"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}