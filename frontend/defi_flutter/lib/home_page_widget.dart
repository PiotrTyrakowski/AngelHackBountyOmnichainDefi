import 'package:flutter/material.dart';
import 'rounded_container.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    // return LoginFirstWidget(child: _buildGamesLib(context));
    return _buildGamesLib(context);
  }

  Widget _buildGamesLib(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("data")],
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