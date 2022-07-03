import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes/core/usecases/usecase.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuote getRandomQuoteUsecase;
  RandomQuoteCubit({required this.getRandomQuoteUsecase})
      : super(RandomQuoteInitial());

  Future<void> getRandomQuote() async {
    emit(RandomQuoteLoading());
    emit((await getRandomQuoteUsecase(NoParams())).fold(
      (failure) => RandomQuoteError(message: failure.getMessage),
      (quote) => RandomQuoteLoaded(quote: quote),
    ));
  }
}
