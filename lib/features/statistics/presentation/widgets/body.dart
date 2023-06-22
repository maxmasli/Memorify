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

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        final bloc = context.read<StatisticsBloc>();
        if (state is StatisticsLoaded) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        horizontalInterval: 1,
                        verticalInterval: 1,
                        drawVerticalLine: false,
                        drawHorizontalLine: false,
                      ),
                      titlesData: FlTitlesData(
                        rightTitles: const AxisTitles(),
                        topTitles: const AxisTitles(),
                        bottomTitles: const AxisTitles(),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: leftTitleWidgets,
                            reservedSize: 32,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color:
                              Theme.of(context).textTheme.bodyMedium!.color!,
                        ),
                      ),
                      minX: 0,
                      maxX: state.ratingList.length.toDouble() - 1,
                      minY: 0,
                      maxY: state.maxRating.toDouble() + 2,
                      lineBarsData: [
                        LineChartBarData(
                          color: Theme.of(context).colorScheme.primary,
                          spots: getFlSpots(state.ratingList),
                          barWidth: 5,
                          dotData: const FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                    ),
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

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value % 5 == 0) {
      return Text(
        value.toInt().toString(),
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      );
    } else {
      return const SizedBox();
    }
  }

  List<FlSpot> getFlSpots(List<RatingEntity> ratingList) {
    final spots = <FlSpot>[];
    for (var i = 0; i < ratingList.length; i++) {
      spots.add(FlSpot(i.toDouble(), ratingList[i].rating.toDouble()));
    }
    return spots;
  }
}
