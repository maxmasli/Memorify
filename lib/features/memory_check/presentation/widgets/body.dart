import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/presentation/widgets/exit_dialog_widget.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/memory_check/presentation/bloc/memory_check_bloc.dart';
import 'package:memorify/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MemoryCheckBloc>();
    return BlocBuilder<MemoryCheckBloc, MemoryCheckState>(
      builder: (context, state) {
        if (state is MemoryCheckLoaded) {
          return WillPopScope(
            onWillPop: () async {
              final isExit = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AskDialogWidget(text: AppStrings.areYouSureToExit);
                },
              );
              if (isExit != null && isExit) {
                await getIt<AppRouter>().push(
                  ResultsRoute(
                    wordsList: state.wordsList,
                    answerWordsList: state.answerWordsList,
                    memoPropertiesEntity: state.memoPropertiesEntity,
                  ),
                );
              }
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.memoPropertiesEntity.wordsCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          onChanged: (s) =>
                              bloc.add(WordChangedEvent(index: index, word: s)),
                          cursorColor: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .color,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!,
                                width: 2,
                              ),
                            ),
                            isDense: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
                AppButtonWidget(
                  text: AppStrings.end,
                  onPressed: () {
                    getIt<Talker>()
                        .debug('answer words: ${state.answerWordsList}');
                    context.router.push(
                      ResultsRoute(
                        answerWordsList: state.answerWordsList,
                        wordsList: state.wordsList,
                        memoPropertiesEntity: state.memoPropertiesEntity,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24)
              ],
            ),
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
