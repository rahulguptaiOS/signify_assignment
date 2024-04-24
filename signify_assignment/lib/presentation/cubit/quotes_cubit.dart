import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share/share.dart';
import 'package:signify_assignment/domain/repository/quote_repository.dart';
import 'package:signify_assignment/presentation/cubit/quotes_state.dart';

import '../../domain/entity/quote.dart';
import '../../domain/usecases/get_quotes.dart';

class QuotesCubit extends Cubit<QuotesState> {

  List<Color> beautifulColors = [
    Colors.red,
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.amber,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.cyan,
    Colors.deepPurple,
    Colors.lime,
    Colors.blueGrey,
    Colors.brown,
    Colors.grey,
  ];
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
        value.isNotEmpty ? emit(QuotesLoadedState(value.first, _generateRandomItem(beautifulColors))) : emit(ErrorState("No Quote found", _generateRandomItem(beautifulColors)));
      });
    } catch (e) {
      emit(ErrorState(e.toString(), _generateRandomItem(beautifulColors)));
    }
  }


  void shareQuote(Quote? quote) {
    Share.share(quote?.content ?? "" + " -" + (quote?.author ?? ""));
  }

  void rateQuote(Quote? quote, double rate, Color color) {
    quote?.rate = rate;
    emit(QuotesLoadedState(quote, color));
  }

  _generateRandomItem(items) {
    final Random random = Random();
    final int index = random.nextInt(items.length);
    return items[index];
  }
}