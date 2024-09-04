import 'package:flutter/material.dart';
import 'rounded_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: LayoutBuilder(builder: (context, constraints) {
            return RoundedContainer(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                borderColor: Colors.white,
                child: const Text("test"));
          })),
    );
  }
}
