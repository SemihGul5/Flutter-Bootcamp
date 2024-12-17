import 'package:flutter/material.dart';

class SaydaIki extends StatefulWidget {
  const SaydaIki({super.key});

  @override
  State<SaydaIki> createState() => _SaydaIkiState();
}

class _SaydaIkiState extends State<SaydaIki> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Sayfa 2",style: TextStyle(fontSize: 30),),
    );
  }
}
