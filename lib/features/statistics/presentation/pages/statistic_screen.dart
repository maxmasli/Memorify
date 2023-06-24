import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/statistics/presentation/bloc/statistics_bloc.dart';
import 'package:memorify/features/statistics/presentation/widgets/body.dart';

@RoutePage()
class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsBloc()..add(GetStatisticsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.statistic),
        ),
        body: const Body(),
      ),
    );
  }
}
