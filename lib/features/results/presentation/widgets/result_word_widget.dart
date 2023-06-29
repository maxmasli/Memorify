import 'package:flutter/material.dart';
import 'package:memorify/core/styles/colors.dart';
import 'package:memorify/features/results/domain/entity/result_word_entity.dart';

class ResultWordWidget extends StatelessWidget {
  const ResultWordWidget({
    required this.resultWordEntity,
    super.key,
  });

  final ResultWordEntity resultWordEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: resultWordEntity.isRight ? AppColors.right : AppColors.error,
        ),
      ),
      child: Text(
        resultWordEntity.answerWord.word,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24),
      ),
    );
  }
}
