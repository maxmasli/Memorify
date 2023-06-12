import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/rating_menu/presentation/bloc/rating_menu_bloc.dart';
import 'package:memorify/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingMenuBloc, RatingMenuState>(
      builder: (context, state) {
        if (state is RatingMenuLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.rating +
                          state.memoPropertiesEntity.ratingEntity!.rating
                              .toString(),
                    ),
                    Text(
                      AppStrings.wordsCount +
                          state.memoPropertiesEntity.wordsCount.toString(),
                    ),
                    Text(
                      AppStrings.time +
                          state.memoPropertiesEntity.time.toString() +
                          AppStrings.sec,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  AppButtonWidget(
                    text: AppStrings.back,
                    onPressed: () {
                      context.router.pop();
                    },
                  ),
                  const SizedBox(height: 24),
                  AppButtonWidget(
                    text: AppStrings.start,
                    onPressed: () {
                      context.router.push(
                        MemoryGameRoute(
                          memoPropertiesEntity: state.memoPropertiesEntity,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          );
        } else if (state is RatingMenuLoading) {
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
