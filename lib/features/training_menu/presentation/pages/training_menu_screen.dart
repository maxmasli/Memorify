import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/features/training_menu/presentation/bloc/training_menu_bloc.dart';

import 'package:memorify/features/training_menu/presentation/widgets/body.dart';

@RoutePage()
class TrainingMenuScreen extends StatelessWidget {
  const TrainingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingMenuBloc(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
