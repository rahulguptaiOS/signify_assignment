import 'package:flutter/material.dart';

class QuoteErrorWidget extends StatelessWidget {
  final String message;
  final Color color;

  const QuoteErrorWidget(
      {super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                  fontSize: 18, color: Colors.white), // Text color
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
