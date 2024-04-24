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
  final Quote? quote;
  final Color color;

  QuotesLoadedState(this.quote, this.color);
  @override
  List<Object?> get props => [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is QuotesLoadedState && runtimeType == other.runtimeType && quote == other.quote;


  @override
  int get hashCode => quote.hashCode;
}

class ErrorState extends QuotesState {
  final String? message;
  final Color color;

  ErrorState(this.message, this.color);

  @override
  List<Object> get props => [];
}