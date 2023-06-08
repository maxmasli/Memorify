import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Text(
              AppStrings.introductionText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Text(
              AppStrings.chainText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Text(
            AppStrings.matryoshkaText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        SingleChildScrollView(
          child: Text(
            AppStrings.cicerosMethodText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
