import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:signify_assignment/presentation/cubit/quotes_state.dart';
import '../../domain/entity/quote.dart';
import '../../domain/use_cases/get_quotes.dart';

class QuotesCubit extends Cubit<QuotesState> {
  QuotesCubit({required this.getQuotesUseCase}) : super(InitialState()) {
    fetchRandomQuotes();
  }

  final GetQuotesUseCase getQuotesUseCase;

  void fetchRandomQuotes() {
    try {
      getQuotesUseCase().then((value) {
        value.isNotEmpty
            ? emit(QuotesLoadedState(value))
            : emit(ErrorState("No Quote found"));
      });
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  void shareQuote(Quote? quote) {
    Share.share("${quote?.content} -${quote?.author ?? ""}");
  }
}
