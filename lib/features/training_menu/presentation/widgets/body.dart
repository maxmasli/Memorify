import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/presentation/widgets/app_number_text_field.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/core/styles/colors.dart';
import 'package:memorify/features/training_menu/presentation/bloc/training_menu_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TrainingMenuBloc>();
    return BlocBuilder<TrainingMenuBloc, TrainingMenuState>(
      builder: (context, state) {
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
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Text(AppStrings.wordsCount),
                        AppNumberTextField(
                          onChanged: (value) => bloc.add(
                            SetWordCountEvent(value: value),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      children: [
                        Text(AppStrings.time),
                        AppNumberTextField(
                          onChanged: (value) => bloc.add(
                            SetTimeEvent(value: value),
                          ),
                        ),
                        Text(AppStrings.sec)
                      ],
                    ),
                  ),
                  if (state.wordCountError != null)
                    Text(
                      state.wordCountError!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16, color: AppColors.error),
                    ),
                  if (state.timeError != null)
                    Text(
                      state.timeError!,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16, color: AppColors.error),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                AppButtonWidget(
                  text: AppStrings.back,
                  onPressed: () => context.router.pop(),
                ),
                const SizedBox(height: 24),
                AppButtonWidget(
                  text: AppStrings.start,
                  onPressed: () {
                    bloc.add(StartGameEvent());
                  },
                ),
                const SizedBox(height: 24),
              ],
            )
          ],
        );
      },
    );
  }
}
