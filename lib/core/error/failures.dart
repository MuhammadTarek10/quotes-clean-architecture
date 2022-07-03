import 'package:equatable/equatable.dart';
import 'package:quotes/core/utils/app_strings.dart';

abstract class Failure extends Equatable {
  String get getMessage;

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  final String message = AppStrings.serverFailure;

  @override
  List<Object?> get props => [message];
  
  @override
  String get getMessage => message;
}

class CacheFailure extends Failure {
  final String message = AppStrings.cacheFailure;

  @override
  List<Object?> get props => [message];
  
  @override
  String get getMessage => message;
}
