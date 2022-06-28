import 'package:flutter/material.dart';
import 'package:quotes/features/random_quote/presentation/views/quote_view.dart';

class Routes {
  static const String initailRoute = "/";
  static const String favoriteQuotes = "/favourite";

  static const String undefined = "/undefined";
}

class AppRouteGenerator {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initailRoute:
        return MaterialPageRoute(builder: (context) => const QuoteView());
      case Routes.favoriteQuotes:
        return MaterialPageRoute(builder: (context) => const QuoteView());
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Undefined"),
        ),
      ),
    );
  }
}
