import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/my_app.dart';
import 'package:flutter_clean_architecture/setup.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
