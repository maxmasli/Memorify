import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/main_menu/presentation/widgets/widgets.dart';
import 'package:memorify/router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(40),
            child: AppNameWidget(),
          ),
          AppButtonWidget(
            text: AppStrings.play,
            onPressed: () {
              context.router.push(const RatingMenuRoute());
            },
          ),
          const SizedBox(height: 24),
          AppButtonWidget(
            text: AppStrings.training,
            onPressed: () {
              context.router.push(const TrainingMenuRoute());
            },
          ),
          const SizedBox(height: 24),
          AppButtonWidget(text: AppStrings.statistic, onPressed: () {}),
          const SizedBox(height: 24),
          AppButtonWidget(
            text: AppStrings.tutorial,
            onPressed: () {
              context.router.push(const TutorialRoute());
            },
          )
        ],
      ),
    );
  }
}
