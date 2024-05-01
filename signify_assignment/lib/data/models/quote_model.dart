import 'package:signify_assignment/domain/entity/quote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel extends Quote {
  QuoteModel(this.tags, this.authorSlug, this.dateAdded, this.dateModified,
      this.length, super.id, super.content, super.author);

  final List<String>? tags;
  final String? authorSlug;
  final String? dateAdded;
  final String? dateModified;
  final int? length;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);
}
