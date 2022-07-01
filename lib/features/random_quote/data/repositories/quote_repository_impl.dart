import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_remote_datasource.dart';
import 'package:quotes/features/random_quote/domain/entities/quote.dart';
import 'package:quotes/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';

class QuoreRepositoryImpl implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoreRepositoryImpl({
    required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource,
  });
  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final quote = await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(quote);
        return Right(quote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final quote = await randomQuoteLocalDataSource.getLastRandomQuote();
        return Right(quote);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
