import 'package:flutter/material.dart';

/// RouteAware課題のボトムシート
class RouteAwareBottomSheet extends StatelessWidget {
  const RouteAwareBottomSheet({super.key});

  /// ルート名
  static const routeName = '/route_aware/bottom_sheet';

  /// ボトムシートを表示する
  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => const RouteAwareBottomSheet(),
    );
  }

  /// RouteSettings付きでボトムシートを表示する
  static Future<void> showWithSettings(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      routeSettings: const RouteSettings(name: routeName),
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
