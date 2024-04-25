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

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'pagination': instance.pagination,
      'totalQuotes': instance.totalQuotes,
      'data': instance.data,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      currentPage: json['currentPage'] as int,
      nextPage: json['nextPage'] as int,
      totalPages: json['totalPages'] as int,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'nextPage': instance.nextPage,
      'totalPages': instance.totalPages,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      quoteText: json['quoteText'] as String,
      quoteAuthor: json['quoteAuthor'] as String,
      quoteGenre: json['quoteGenre'] as String,
      v: json['v'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'quoteText': instance.quoteText,
      'quoteAuthor': instance.quoteAuthor,
      'quoteGenre': instance.quoteGenre,
      'v': instance.v,
    };
