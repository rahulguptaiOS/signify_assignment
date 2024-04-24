import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signify_assignment/data/source/quote_repository_impl.dart';
import 'package:signify_assignment/di/service_locator.dart';
import 'package:signify_assignment/presentation/widgets/quotes_slider.dart';

import 'presentation/cubit/quotes_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator().then((value) => runApp(const MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => getIt<QuotesCubit>(),
        child: QuoteSlider(),
      )
    );
  }
}
