import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/presentation/widgets/app_button_widget.dart';
import 'package:memorify/core/presentation/widgets/error_screen.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/features/memory_check/presentation/bloc/memory_check_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemoryCheckBloc, MemoryCheckState>(
      builder: (context, state) {
        if (state is MemoryCheckLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.memoPropertiesEntity.wordsCount,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
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
                onPressed: () {},
              ),
              const SizedBox(height: 24)
            ],
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
