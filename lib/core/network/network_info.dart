import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetwrokInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetwrokInfoImpl({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
