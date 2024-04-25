import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:signify_assignment/domain/entity/quote.dart';

abstract class QuotesState extends Equatable {}
class QuotesLoadingState extends QuotesState {
  @override
  List<Object?> get props => [];
}

class InitialState extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesLoadedState extends QuotesState {
  final List<Quote?> quotes;

  QuotesLoadedState(this.quotes);
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuotesLoadedState && runtimeType == other.runtimeType && quotes == other.quotes;


  @override
  int get hashCode => quotes.hashCode;
}

class ErrorState extends QuotesState {
  final String? message;

  ErrorState(this.message);

  @override
  List<Object> get props => [];
}