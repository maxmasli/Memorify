import 'package:flutter/material.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Memorify',
      style: TextStyle(fontFamily: 'Montserrat', fontSize: 50),
    );
  }
}
