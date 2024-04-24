import 'package:signify_assignment/domain/entity/quote.dart';

abstract class QuoteRepository {
  Future<List<Quote>> getQuote();
}