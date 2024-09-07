import 'package:defi_flutter/contracts/contract_adapter.dart';
import 'package:flutter/material.dart';
import 'package:defi_flutter/contract_page_widgets/arg_widget.dart';
import 'dart:convert';

class MethodWidget extends StatefulWidget {
  final String _methodName;
  final List<(String, String)> _args;
  final String _abi;
  final String _contractAddress;

  const MethodWidget({
    Key? key,
    required String methodName,
    required List<(String, String)> args,
    required String abi,
    required String contractAddress
  })  : _methodName = methodName,
        _args = args,
        _abi = abi,
        _contractAddress = contractAddress,
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

  (String, String, String) getJsonLists() {
    List<String> argValues =
        _controllers.map((controller) => controller.text.trim()).toList();

    // Check for empty inputs
    if (argValues.any((input) => input.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields must be filled')),
      );
      return ("FAILED", "FAILED", "FAILED");
    }

    // preparing right format of jsons
    List<String> argNames = [];
    List<String> argTypes = [];

    for (var arg in widget._args) {
      argNames.add(arg.$1);
      argTypes.add(arg.$2);
    }

    String jsonArgNames = jsonEncode(argNames);
    String jsonArgTypes = jsonEncode(argTypes);
    String jsonArgValues = jsonEncode(argValues);

    return (jsonArgNames, jsonArgTypes, jsonArgValues);
  }

  Future<String> executeMethodWrapper((String jsonArgNames, String jsonArgTypes, String jsonArgValues) tuple) async
  {
    return await ContractAdapter.executeContractMethod(widget._abi, widget._contractAddress, widget._methodName, tuple.$1, tuple.$2, tuple.$3);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        child: Card.filled(
          color: Colors.blue[100],
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "\"${widget._methodName}\" method",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
                      onPressed: () async{
                        String output = await executeMethodWrapper(getJsonLists());
                        print(output);
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
