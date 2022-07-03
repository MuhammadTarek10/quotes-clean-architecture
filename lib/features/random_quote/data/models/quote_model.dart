import 'package:quotes/features/random_quote/domain/entities/quote.dart';

class QuoteModel extends Quote {
  const QuoteModel(
      {required int id,
      required String author,
      required String content,
      required String permalink})
      : super(
          id: id,
          author: author,
          content: content,
          permalink: permalink,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        author: json["author"],
        id: json["id"],
        content: json["quote"],
        permalink: json["permalink"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "id": id,
        "content": content,
        "permalink": permalink,
      };
}
