import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_assets.dart';
import 'package:quotes/core/utils/app_strings.dart';

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
        title: const Text(AppStrings.appName),
      ),
      body: Center(
        child: Image.asset(AppImages.minsitry),
      ),
    );
  }
}
