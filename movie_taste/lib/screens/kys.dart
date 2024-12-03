import 'package:flutter/material.dart';

class KysScreen extends StatelessWidget {
  const KysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kys Screen")),
      body: const Center(
        child: Text("You are now in the Kys Screen!"),
      ),
    );
  }
}
