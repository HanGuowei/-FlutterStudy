import 'package:flutter/material.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:flutter_study/task6/task6_app.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = FavoriteStoreModel();
  await model.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => model,
      child: const Task6App(),
    ),
  );
}
