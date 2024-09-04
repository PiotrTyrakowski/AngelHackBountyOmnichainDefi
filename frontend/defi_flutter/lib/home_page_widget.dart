import 'package:defi_flutter/contracts/contract_info.dart';
import 'package:defi_flutter/contracts/contract_widget.dart';
import 'package:flutter/material.dart';
import 'rounded_container.dart';
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
    // return LoginFirstWidget(child: _buildGamesLib(context));
    return _buildGamesLib(context);
  }

  Widget _buildGamesLib(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contractList.map((contract) => ContractWidget(
                    info: contract,
                    onClick: () {
                      setState(() {
                        _selectedcontract = contract;
                      });
                    },
                  )).toList(),
      ),
    );
  }
}


        // children: swaps
        //     .map((swap) => SwapBlankWidget(
        //         info: swap,
        //         onClick: () {
        //           setState(() {
        //             _selectedSwapId = swap.contractId;
        //             _contractInfo = swap;
        //           });
        //         },
        //         onAccept: () => {},
        //         onDecline: () => {}))
        //     .toList(),