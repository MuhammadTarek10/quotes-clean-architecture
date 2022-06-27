import 'package:flutter/material.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({Key? key}) : super(key: key);

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote View'),
      ),
    );
  }
}
