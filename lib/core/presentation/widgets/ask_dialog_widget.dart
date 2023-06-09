import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';

class AskDialogWidget extends StatelessWidget {
  const AskDialogWidget({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(AppStrings.warning),
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      actions: [
        TextButton(
          child: Text(
            AppStrings.yes,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        TextButton(
          child: Text(
            AppStrings.no,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}
