import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memorify/app/app.dart';
import 'package:memorify/core/data/models/rating_model.dart';
import 'package:memorify/di.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(RatingModelAdapter());

  initDI();


  Bloc.observer = TalkerBlocObserver(talker: getIt<Talker>());

  runApp(App());
}
