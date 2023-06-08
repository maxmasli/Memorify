import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/features/rating_menu/presentation/bloc/rating_menu_bloc.dart';
import 'package:memorify/features/rating_menu/presentation/widgets/body.dart';

@RoutePage()
class RatingMenuScreen extends StatelessWidget {
  const RatingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingMenuBloc()..add(CalculatePropertiesEvent()),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
