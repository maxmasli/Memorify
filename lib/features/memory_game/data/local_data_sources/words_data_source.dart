import 'package:memorify/features/memory_game/data/models/word_model.dart';

abstract interface class WordsDataSource {
  List<WordModel> getRandomWords(int count);
}

class WordsDataSourceImpl implements WordsDataSource {
  @override
  List<WordModel> getRandomWords(int count) {
    //TODO load words from file mb
    final words = [
      const WordModel(word: 'asdsad'),
      const WordModel(word: 'kal'),
      const WordModel(word: 'loh'),
      const WordModel(word: 'kal'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
      const WordModel(word: 'popsaod'),
    ];
    return words.sublist(0, count);
  }
}
