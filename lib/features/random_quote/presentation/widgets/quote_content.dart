import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({Key? key, required this.quote}) : super(key: key);
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              quote.content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                quote.author,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
