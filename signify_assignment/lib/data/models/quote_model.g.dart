// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteModel _$QuoteModelFromJson(Map<String, dynamic> json) => QuoteModel(
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['authorSlug'] as String?,
      json['dateAdded'] as String?,
      json['dateModified'] as String?,
      json['length'] as int?,
      json['_id'] as String,
      json['content'] as String?,
      json['author'] as String?,
    );

Map<String, dynamic> _$QuoteModelToJson(QuoteModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'author': instance.author,
      'tags': instance.tags,
      'authorSlug': instance.authorSlug,
      'dateAdded': instance.dateAdded,
      'dateModified': instance.dateModified,
      'length': instance.length,
    };
