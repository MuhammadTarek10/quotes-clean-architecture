import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/widgets/error_widget.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:quotes/features/random_quote/presentation/widgets/quote_content.dart';

class QuoteView extends StatefulWidget {
  const QuoteView({Key? key}) : super(key: key);

  @override
  State<QuoteView> createState() => _QuoteViewState();
}

class _QuoteViewState extends State<QuoteView> {
  Future<void> _getRandomQuote() =>
      BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();

  @override
  void initState() {
    super.initState();
    _getRandomQuote();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
        builder: (context, state) {
      if (state is RandomQuoteLoading) {
        return Center(
          child: SpinKitFadingCircle(
            itemBuilder: ((context, index) => const DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                )),
          ),
        );
      } else if (state is RandomQuoteError) {
        return const ErrorView();
      } else if (state is RandomQuoteLoaded) {
        return Column(
          children: [
            QuoteContent(quote: state.quote),
            InkWell(
              onTap: () => _getRandomQuote(),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.quoteColor,
                ),
                child: const Icon(
                  Icons.refresh,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      } else {
        return SpinKitFadingCircle(
          itemBuilder: ((context, index) => const DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
              )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _getRandomQuote(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.appName),
        ),
        body: _buildBodyContent(),
      ),
    );
  }
}
