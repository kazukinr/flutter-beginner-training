import 'package:flutter/material.dart';

/// RouteAware課題のボトムシート
class RouteAwareBottomSheet extends StatelessWidget {
  const RouteAwareBottomSheet({super.key});

  /// ボトムシートを表示する
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => const RouteAwareBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ボトムシート',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('閉じる'),
            ),
          ),
        ],
      ),
    );
  }
}
