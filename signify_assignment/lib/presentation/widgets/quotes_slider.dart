import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_assignment/presentation/cubit/quotes_state.dart';
import 'package:signify_assignment/presentation/widgets/quote_page.dart';
import 'package:signify_assignment/presentation/widgets/rate_alert.dart';
import '../../constants/colors.dart';
import '../../domain/entity/quote.dart';
import '../cubit/quotes_cubit.dart';
import 'error_widget.dart';

class QuoteSlider extends StatefulWidget {
  const QuoteSlider({super.key});

  @override
  QuoteSliderState createState() => QuoteSliderState();
}

class QuoteSliderState extends State<QuoteSlider> {
  late Timer? _timer;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<Quote> _items = [];
  final List<Color> _colors = [];

  void _startAutoScroll(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer timer) {
      if (_currentPage < _items.length - 1) {
        _currentPage++;
      } else {
        BlocProvider.of<QuotesCubit>(context).fetchRandomQuotes();
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _rateQuote(Quote? quote, double rate) {
    var index = _items.indexWhere((element) => element.id == quote?.id);
    _items[index].rate = rate;
  }

  @override
  Widget build(BuildContext context) {
    _startAutoScroll(context);
    return Scaffold(
      body: BlocBuilder<QuotesCubit, QuotesState>(
          builder: (BuildContext context, state) {
        if (state is QuotesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return QuoteErrorWidget(
              message: state.message ?? "", color: Colors.red);
        } else if (state is QuotesLoadedState) {
          _items.addAll(state.quotes.nonNulls.toList());
          _colors.addAll(beautifulColors);
          return Center(
            child: PageView.builder(
                itemCount: _items.length,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      QuotePage(quote: _items[index], color: _colors[index]),
                      Positioned(
                        right: 10,
                        bottom: 10,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  BlocProvider.of<QuotesCubit>(context)
                                      .shareQuote(_items[index]);
                                },
                                icon: const Icon(Icons.share,
                                    color: Colors.white)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (alertContext) {
                                        return RateAlert(
                                            onRatingUpdate: (rate) =>
                                                _rateQuote(_items[index], rate),
                                            defaultRate: _items[index].rate);
                                      });
                                },
                                icon: const Icon(Icons.star_rate,
                                    color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
