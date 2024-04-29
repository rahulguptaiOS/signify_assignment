// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) =>
    QuoteResponse(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      totalQuotes: json['totalQuotes'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: json['currentPage'] as int,
      nextPage: json['nextPage'] as int,
      totalPages: json['totalPages'] as int,
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['_id'] as String,
      quoteText: json['quoteText'] as String,
      quoteAuthor: json['quoteAuthor'] as String,
      quoteGenre: json['quoteGenre'] as String,
      v: json['__v'] as int,
    );

