import 'package:signify_assignment/data/models/quote_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quote_response.g.dart';

@JsonSerializable()
class QuoteResponse {
  final int statusCode;
  final String message;
  final Pagination pagination;
  final int totalQuotes;
  final List<Data> data;

  QuoteResponse({
    required this.statusCode,
    required this.message,
    required this.pagination,
    required this.totalQuotes,
    required this.data,
  });

  List<QuoteModel> getQuoteList(){
    List<QuoteModel> list = [];
    data.map((item) {
      list.add(QuoteModel(null, null, null, null, 0, item.id, item.quoteText, item.quoteAuthor));
    });
    return list;
  }

  factory QuoteResponse.fromJson(Map<String, dynamic> json) => _$QuoteResponseFromJson(json);
}

@JsonSerializable()
class Pagination {
  final int currentPage;
  final int nextPage;
  final int totalPages;

  Pagination({
    required this.currentPage,
    required this.nextPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@JsonSerializable()
class Data {
  final String id;
  final String quoteText;
  final String quoteAuthor;
  final String quoteGenre;
  final int v;

  Data({
    required this.id,
    required this.quoteText,
    required this.quoteAuthor,
    required this.quoteGenre,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
