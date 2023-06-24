import 'package:flutter/services.dart' show rootBundle;
import 'package:memorify/features/memory_game/data/models/word_model.dart';

abstract interface class WordsDataSource {
  Future<List<WordModel>> getRandomWords(int count);
}

class WordsDataSourceImpl implements WordsDataSource {
  @override
  Future<List<WordModel>> getRandomWords(int count) async {
    final words = await rootBundle.loadString('assets/files/words-ru.txt');
    final lines = words.split('\n')..shuffle();
    final wordsList =
        lines.sublist(0, count).map((e) => WordModel(word: e)).toList();
    return Future.value(wordsList);
  }
}
