import 'package:flutter/material.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Opacity(
            opacity: .67,
            child: Text(
              'COMMENTS',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.message_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.67),
          ),
          const SizedBox(height: 16),
          const Opacity(
            opacity: .67,
            child: Text(
              'No comments yet',
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
