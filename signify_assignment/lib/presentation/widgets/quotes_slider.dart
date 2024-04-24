import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_assignment/presentation/cubit/quotes_state.dart';
import 'package:signify_assignment/presentation/widgets/quote_page.dart';
import 'package:signify_assignment/presentation/widgets/rate_alert.dart';
import '../cubit/quotes_cubit.dart';
import 'error_widget.dart';

class QuoteSlider extends StatelessWidget {
  late Timer? _timer;
  QuoteSlider({super.key});

  @override
  Widget build(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {

      BlocProvider.of<QuotesCubit>(context).fetchRandomQuotes();
    });
    return Scaffold(
      body: BlocBuilder<QuotesCubit, QuotesState>(builder: (BuildContext context, state) {
        if(state is QuotesLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorState) {
          return  QuoteErrorWidget(message: state.message ?? "", color: state.color);
        } else if (state is QuotesLoadedState) {
            return Center(
              child: Stack(
                children: [
                  QuotePage(quote: state.quote, color: state.color),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                              BlocProvider.of<QuotesCubit>(context).shareQuote(state.quote);
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.white
                            )),
                        IconButton(onPressed: () {
                          showDialog(context: context, builder: (alertContext) {
                            return RateAlert(onRatingUpdate: (rate) => BlocProvider.of<QuotesCubit>(context).rateQuote(state.quote, rate, state.color),
                                defaultRate: state.quote?.rate ?? 1);
                          });
                        },
                            icon: const Icon(
                                Icons.star_rate,
                                color: Colors.white
                            )),
                      ],
                    ),
                  )
                  
                ],
              ),
            );
        } else {
          return Container();
        }

      }),
    );
  }
}