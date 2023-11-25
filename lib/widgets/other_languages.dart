import 'package:flutter/material.dart';

class OtherLanguages extends StatelessWidget {
  const OtherLanguages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Opacity(
          opacity: .67,
          child: Text(
            'OTHER LANGUAGES',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 8),
        for (int i = 0; i < 20; i++) ...[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Tooltip(
                  message: 'Translated',
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('Testschlüssel'),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text('German'),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
