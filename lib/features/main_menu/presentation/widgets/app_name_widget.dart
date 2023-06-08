import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.appName,
      style: const TextStyle(fontFamily: 'Montserrat', fontSize: 50),
    );
  }
}
