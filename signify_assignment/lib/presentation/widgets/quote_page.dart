import 'package:flutter/material.dart';

import '../../domain/entity/quote.dart';

class QuotePage extends StatelessWidget {
  final Quote? quote;
  final Color color;

  const QuotePage({super.key, required this.quote, required this.color});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  quote?.content ?? "",
                  style: const TextStyle(fontSize: 18, color: Colors.white), // Text color
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  '- ${quote?.author}',
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.white), // Text color
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
      ),
    );
  }
}