import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
          title: const Text("Методы запоминания"),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("Введение"),
              ),
              Tab(
                child: Text("Цепочка"),
              ),
              Tab(
                child: Text("Матрешка"),
              ),
              Tab(
                child: Text("Метод Цицерона"),
              ),
            ],
          ),
        ),
        body: const Body(),
      ),
    );
  }
}
