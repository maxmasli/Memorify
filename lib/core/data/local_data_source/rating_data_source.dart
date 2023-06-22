import 'package:hive_flutter/hive_flutter.dart';
import 'package:memorify/core/data/models/rating_model.dart';
import 'package:memorify/di.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract interface class RatingDataSource {
  Future<RatingModel> getRating();

  Future<void> saveRating(RatingModel model);

  Future<List<RatingModel>> getAllRating();

  Future<void> deleteRating();
}

class RatingDataSourceImpl implements RatingDataSource {
  @override
  Future<RatingModel> getRating() async {
    final box = await Hive.openBox<RatingModel>('rating');

    final lastIndex = box.values.length - 1;
    if (lastIndex == -1) {
      getIt<Talker>().debug('No saved rating, return 0');
      return Future.value(const RatingModel(rating: 0));
    }

    final rating = box.getAt(lastIndex);
    await box.close();
    if (rating == null) {
      getIt<Talker>().error('Something went wrong in hive');
      return Future.value(const RatingModel(rating: 0));
    } else {
      return Future.value(rating);
    }
  }

  @override
  Future<void> saveRating(RatingModel model) async {
    final box = await _openBox();
    await box.add(model);
    await box.close();
  }

  @override
  Future<List<RatingModel>> getAllRating() async {
    final box = await _openBox();
    final ratingList = box.values.toList();
    await box.close();
    return Future.value(ratingList);
  }

  @override
  Future<void> deleteRating() async {
    final box = await _openBox();
    await box.deleteFromDisk();
    await box.close();
  }

  Future<Box<RatingModel>> _openBox() async {
    return Hive.openBox<RatingModel>('rating');
  }


}
