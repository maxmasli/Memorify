import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/presentation/widgets/app_small_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/presentation/widgets/exit_dialog_widget.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/statistics/presentation/bloc/statistics_bloc.dart';
import 'package:memorify/features/statistics/presentation/widgets/chart_painter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        final bloc = context.read<StatisticsBloc>();
        if (state is StatisticsLoaded) {
          return Column(
            children: [
              InteractiveViewer(
                transformationController: _transformationController,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  //width: MediaQuery.of(context).size.height,
                  height: 500,
                  child: CustomPaint(
                    painter: ChartPainter(
                      state.ratingList
                          .map((e) => e.rating.toDouble())
                          .toList(),
                    ),
                    size: Size.infinite,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.maxRating + state.maxRating.toString(),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    AppSmallButtonWidget(
                      child: const Icon(Icons.delete),
                      onTap: () async {
                        final isDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AskDialogWidget(
                              text: AppStrings.areYouSureToDelete,
                            );
                          },
                        );
                        if (isDelete != null && isDelete) {
                          bloc.add(DeleteStatisticsEvent());
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          );
        } else if (state is StatisticsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
