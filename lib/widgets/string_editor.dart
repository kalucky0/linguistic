import 'package:flutter/material.dart';

class StringEditor extends StatelessWidget {
  const StringEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Opacity(
          opacity: .67,
          child: Text(
            'SOURCE STRING',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Test key',
        ),
        const SizedBox(height: 16),
        const Opacity(
          opacity: .67,
          child: Text(
            'Key: "string.test_key"',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: 'Translation',
          ),
          minLines: 3,
          maxLines: 5,
        ),
        const SizedBox(height: 12),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text('SAVE'),
          ),
        ),
      ],
    );
  }
}
