import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
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
          AppButtonWidget(text: 'Играть', onPressed: () {}),
          const SizedBox(height: 24),
          AppButtonWidget(text: 'Тренировка', onPressed: () {}),
          const SizedBox(height: 24),
          AppButtonWidget(text: 'Статистика', onPressed: () {}),
          const SizedBox(height: 24),
          AppButtonWidget(
            text: 'Обучение',
            onPressed: () {
              context.router.push(const TutorialRoute());
            },
          ),
        ],
      ),
    );
  }
}
