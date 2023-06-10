import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';

class ExitDialogWidget extends StatelessWidget {
  const ExitDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(AppStrings.warning),
      content: Text(
        AppStrings.areYouSure,
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
