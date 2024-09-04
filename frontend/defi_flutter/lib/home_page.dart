import 'package:flutter/material.dart';
import 'rounded_container.dart';
import 'home_page_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                const Text("BestContracts",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    )),
                Expanded(
                  child: RoundedContainer(
                    width: constraints.maxWidth,
                    height: null,
                    borderColor: Colors.white,
                    child: const HomePageWidget(),
                  ),
                ),
              ],
            );
          })),
    );
  }
}
