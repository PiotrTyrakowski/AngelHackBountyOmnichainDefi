import 'package:flutter/material.dart';
import 'contract_page_widgets/appbar_widget.dart';
import 'contract_page_widgets/header_widget.dart';
import 'contract_page_widgets/download_button_widget.dart';
import 'contract_page_widgets/section_title_widget.dart';
import 'contract_page_widgets/function_area_widget.dart';
import 'contract_page_widgets/function_description_widget.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Contract name"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: "Headline",
              subtitle:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              description:
                  "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
            ),
            SizedBox(height: 16),
            DownloadButtonWidget(),
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
