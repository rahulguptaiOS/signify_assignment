import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:signify_assignment/domain/repository/quote_repository.dart';
import 'package:signify_assignment/presentation/cubit/quotes_state.dart';

import '../../constants/colors.dart';
import '../../domain/entity/quote.dart';
import '../../domain/usecases/get_quotes.dart';

class QuotesCubit extends Cubit<QuotesState> {

  QuotesCubit({required this.getQuotesUseCase}) : super(InitialState()) {
    fetchRandomQuotes();
  }

  final GetQuotesUseCase getQuotesUseCase;
  late List<Quote> _value;


  void fetchRandomQuotes() {
    try {
      getQuotesUseCase.call()
      .then((value) {
        _value = value;
        print(value);
        value.isNotEmpty ? emit(QuotesLoadedState(value)) : emit(ErrorState("No Quote found"));
      });
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }


  void shareQuote(Quote? quote) {
    Share.share(quote?.content ?? "" + " -" + (quote?.author ?? ""));
  }
}