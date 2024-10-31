import 'package:flutter/material.dart';

class TxDetailsInfo extends StatelessWidget {
  const TxDetailsInfo({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 4,
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyLarge!,
              textAlign: TextAlign.end,
              child: Text(subtitle),
            ),
          ),
        ],
      ),
    );
  }
}
