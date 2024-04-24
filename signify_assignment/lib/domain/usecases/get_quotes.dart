import 'package:signify_assignment/domain/entity/quote.dart';
import 'package:signify_assignment/domain/repository/quote_repository.dart';

class GetQuotesUseCase {
  GetQuotesUseCase({
    required QuoteRepository repository,
  }) : _repository = repository;

  final QuoteRepository _repository;

  Future<List<Quote>> call() async {
    final list = await _repository.getQuote();
    return list;
  }
}