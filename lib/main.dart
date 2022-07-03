import 'package:flutter/material.dart';
import 'package:quotes/app.dart';
import 'package:quotes/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const QuotesApp());
}
