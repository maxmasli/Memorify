import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/tutorial/presentation/widgets/body.dart';

@RoutePage()
class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.memorizationMethods),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(AppStrings.introduction),
              ),
              Tab(
                child: Text(AppStrings.chain),
              ),
              Tab(
                child: Text(AppStrings.matryoshka),
              ),
              Tab(
                child: Text(AppStrings.cicerosMethod),
              ),
            ],
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
