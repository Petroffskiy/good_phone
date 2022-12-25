import 'package:flutter/material.dart';

import '../features/internal/application.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'injection.dart' as inj;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const Application());
  inj.init();

}
