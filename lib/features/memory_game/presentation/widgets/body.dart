import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/core/presentation/widgets/app_small_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/presentation/widgets/ask_dialog_widget.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/memory_game/presentation/bloc/memory_game_bloc.dart';
import 'package:memorify/router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemoryGameBloc, MemoryGameState>(
      listener: (context, state) {
        if (state is MemoryGameLoaded) {
          if (state.timeLeft == 0) {
            context.router.push(
              MemoryCheckRoute(
                memoPropertiesEntity: state.memoPropertiesEntity,
                wordsList: state.wordsList,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        final bloc = context.read<MemoryGameBloc>();
        if (state is MemoryGameLoaded) {
          return WillPopScope(
            onWillPop: () async {
              final isExit = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AskDialogWidget(
                    text: AppStrings.areYouSureToExit,
                  );
                },
              );
              if (isExit != null && isExit) {
                bloc.add(StopMemoryEvent());
                await getIt<AppRouter>().push(
                  ResultsRoute(
                    wordsList: state.wordsList,
                    answerWordsList: List.generate(
                      state.memoPropertiesEntity.wordsCount,
                      (index) => const WordEntity(word: ''),
                    ),
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
                    itemCount: state.wordsList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: Text(
                          state.wordsList[index].word,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                const Divider(color: Colors.black, height: 1),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Align(
                          child: Text(
                            state.timeLeft.toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppSmallButtonWidget(
                            child: const Icon(Icons.arrow_forward),
                            onTap: () {
                              context
                                  .read<MemoryGameBloc>()
                                  .add(StopMemoryEvent());
                              context.router.push(
                                MemoryCheckRoute(
                                  memoPropertiesEntity:
                                      state.memoPropertiesEntity,
                                  wordsList: state.wordsList,
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is MemoryGameLoading) {
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
