import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/presentation/views/quote_view.dart';

class QuotesApp extends StatelessWidget {
  const QuotesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuoteView(),
    );
  }
}

