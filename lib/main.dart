import 'package:flutter/material.dart';
import 'package:flutter_study/task6/task6_app.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: Task6App(),
    ),
  );
}
