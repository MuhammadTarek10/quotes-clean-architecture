import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/api_interceptor.dart';
import 'package:quotes/core/api/dio_consumer.dart';
import 'package:quotes/core/network/network_info.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_local_datasource.dart';
import 'package:quotes/features/random_quote/data/datasources/random_quote_remote_datasource.dart';
import 'package:quotes/features/random_quote/data/repositories/quote_repository_impl.dart';
import 'package:quotes/features/random_quote/domain/repositories/quote_repository.dart';
import 'package:quotes/features/random_quote/domain/usecases/get_random_quote.dart';
import 'package:quotes/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> init() async {
  // Core
  instance.registerLazySingleton<ApiConsumer>(
      () => DioConsumer(client: instance()));
  instance.registerLazySingleton<NetworkInfo>(() => NetwrokInfoImpl(
        internetConnectionChecker: instance(),
      ));

  // External
  final shared = await SharedPreferences.getInstance();
  instance.registerLazySingleton(() => shared);
  instance.registerLazySingleton(() => Dio());
  instance.registerLazySingleton(() => InternetConnectionChecker());
  instance.registerLazySingleton(() => AppInterceptor());
  instance.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestHeader: true,
      responseHeader: true,
      requestBody: true,
      responseBody: true,
    ),
  );
}

void initRandomQuote() {
  // Features
  instance.registerLazySingleton<RandomQuoteRemoteDataSource>(
    () => RandomQuoteRemoteDataSourceImpl(apiConsumer: instance()),
  );
  instance.registerLazySingleton<RandomQuoteLocalDataSource>(
    () => RandomQuoteLocalDataSourceImpl(sharedPreferences: instance()),
  );
  instance.registerLazySingleton<QuoteRepository>(() => QuoreRepositoryImpl(
        networkInfo: instance(),
        randomQuoteLocalDataSource: instance(),
        randomQuoteRemoteDataSource: instance(),
      ));
  instance
      .registerLazySingleton(() => GetRandomQuote(quoteRepository: instance()));

  instance.registerFactory(
      () => RandomQuoteCubit(getRandomQuoteUsecase: instance()));
}
