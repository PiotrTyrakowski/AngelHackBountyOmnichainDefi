import 'package:defi_flutter/contract_page_widgets/CodeDisplayWidget';
import 'package:defi_flutter/contract_page_widgets/method_widget.dart';
import 'package:defi_flutter/contracts/contract_adapter.dart';
import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'contract_page_widgets/appbar_widget.dart';
import 'contract_page_widgets/header_widget.dart';
import 'contract_page_widgets/section_title_widget.dart';
import 'contract_page_widgets/function_area_widget.dart';
import 'contract_page_widgets/function_description_widget.dart';

class ContractPage extends StatelessWidget {
  final ContractInfo contract;

  const ContractPage({super.key, required this.contract});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            title:
                contract.contractTitle), // Example of using the contract info
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  title: contract.contractTitle,
                  subtitle:
                      "Smart contract address: ${contract.contractAddress}",
                  description:
                      contract.contractDescription, // Use contract data
                ),
                const SizedBox(height: 30),
                CodeDisplayWidget(
                  code: contract.contractCode, // Pass the contract code
                ),
                const SizedBox(height: 16),
                ...contract.getContractMethods().map((tuple) {
                  // Extract the method name and arguments from the tuple
                  final methodName = tuple.$1;
                  final args = tuple.$2;

                  // Create a MethodWidget for each method
                  return MethodWidget(
                    methodName: methodName,
                    args: args,
                    abi: contract.contractAbi,
                    contractAddress: contract.contractAddress,
                  );
                }).toList(),
              ],
            ),
          ),
        ));
  }
}
