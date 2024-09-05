import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:flutter/material.dart';
import 'contract_page_widgets/appbar_widget.dart';
import 'contract_page_widgets/header_widget.dart';
import 'contract_page_widgets/download_button_widget.dart';
import 'contract_page_widgets/section_title_widget.dart';
import 'contract_page_widgets/function_area_widget.dart';
import 'contract_page_widgets/function_description_widget.dart';

class ContractPage extends StatelessWidget {
  final ContractInfo contract;  // Add this field

  const ContractPage({super.key, required this.contract});  // Update the constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: contract.contractTitle),  // Example of using the contract info
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: contract.contractTitle,  
              subtitle: "Smart contract address: ${contract.contractAddress}",
              description: contract.contractDescription,  // Use contract data
            ),
            SizedBox(height: 32),
            SectionTitleWidget(),
            SizedBox(height: 16),
            FunctionAreaWidget(),
            SizedBox(height: 32),
            FunctionDescriptionWidget(),
          ],
        ),
      ),
    );
  }
}
