import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:defi_flutter/contracts/contract_widget.dart';
import 'package:flutter/material.dart';
import 'contract_page.dart';
import 'contracts/contracts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  ContractInfo? _selectedcontract;

  @override
  Widget build(BuildContext context) {
    return _buildGamesLib(context);
  }

  Widget _buildGamesLib(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              contractList
                  .map((contract) => ContractWidget(
                        info: contract,
                        onClick: () {
                          setState(() {
                            _selectedcontract = contract;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContractPage(
                                  contract:
                                      contract), 
                            ),
                          );
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
