import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.errorMessage),
    );
  }
}
