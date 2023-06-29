import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/results/presentation/bloc/results_bloc.dart';
import 'package:memorify/features/results/presentation/widgets/result_word_widget.dart';
import 'package:memorify/router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.router.popUntilRoot();
        return false;
      },
      child: BlocBuilder<ResultsBloc, ResultsState>(
        builder: (context, state) {
          if (state is ResultsLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        '${state.resultEntity.countGuessed}/${state.resultEntity.countGuessed + state.resultEntity.countWrong}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (state.memoPropertiesEntity.isRating)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.obtained +
                                  state.obtainedRating!.asCount(),
                            ),
                            Text(
                              AppStrings.rating +
                                  state.rating!.rating.toString(),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListView.builder(
                      itemCount: state.resultWords.length,
                      itemBuilder: (context, index) {
                        return ResultWordWidget(
                          resultWordEntity: state.resultWords[index],
                        );
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    AppButtonWidget(
                      text: AppStrings.playAgain,
                      onPressed: () {
                        if (state.memoPropertiesEntity.isRating) {
                          context.router
                            ..popUntilRoot()
                            ..push(const RatingMenuRoute());
                        } else {
                          context.router
                            ..popUntilRoot()
                            ..push(const TrainingMenuRoute());
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    AppButtonWidget(
                      text: AppStrings.mainMenu,
                      onPressed: () {
                        context.router.popUntilRoot();
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ],
            );
          } else if (state is ResultsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const ErrorScreen();
          }
        },
      ),
    );
  }
}
