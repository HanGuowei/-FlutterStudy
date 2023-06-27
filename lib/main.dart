import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_study/task6/task6_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await dotenv.load();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    const Task6App(),
  );
}
