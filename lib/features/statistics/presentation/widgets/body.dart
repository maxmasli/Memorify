import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/presentation/widgets/app_small_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/presentation/widgets/ask_dialog_widget.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/statistics/presentation/bloc/statistics_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    const gap = 6;
    return BlocBuilder<StatisticsBloc, StatisticsState>(
      builder: (context, state) {
        final bloc = context.read<StatisticsBloc>();
        if (state is StatisticsLoaded) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: max(
                      MediaQuery.of(context).size.width - 20,
                      38 + (gap * state.ratingList.length.toDouble()),
                    ),
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          rightTitles: const AxisTitles(),
                          topTitles: const AxisTitles(),
                          bottomTitles: const AxisTitles(),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: state.maxRating != 0
                                  ? state.maxRating / 5
                                  : 1,
                              reservedSize: 38,
                              getTitlesWidget: (value, titleMeta) {
                                return Text(
                                  value.toInt().toString(),
                                  style: const TextStyle(fontSize: 14),
                                );
                              },
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: _makeFlSpots(state.ratingList),
                            dotData: const FlDotData(show: false),
                            color: Theme.of(context).colorScheme.primary,
                            barWidth: 3,
                          ),
                        ],
                      ),
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

  List<FlSpot> _makeFlSpots(List<RatingEntity> ratingList) {
    final spotsList = <FlSpot>[];
    for (var i = 0; i < ratingList.length; i++) {
      spotsList.add(FlSpot(i.toDouble(), ratingList[i].rating.toDouble()));
    }
    return spotsList;
  }
}
