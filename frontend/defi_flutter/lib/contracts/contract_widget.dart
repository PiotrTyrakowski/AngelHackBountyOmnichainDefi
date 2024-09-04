import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:flutter/material.dart';

class ContractWidget extends StatelessWidget {
  final ContractInfo _info;
  final VoidCallback? onClick;

  const ContractWidget({
    super.key,
    required ContractInfo info,
    this.onClick,
  }) : _info = info;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Use all available horizontal space
      child: InkWell(
        onTap: onClick,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  _info.contractAddress,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
