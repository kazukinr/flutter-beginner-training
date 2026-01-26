import 'package:flutter/material.dart';

/// RouteAware課題のダイアログ
class RouteAwareDialog extends StatelessWidget {
  const RouteAwareDialog({super.key});

  /// ルート名
  static const routeName = '/route_aware/dialog';

  /// ダイアログを表示する
  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const RouteAwareDialog(),
    );
  }

  /// RouteSettings付きでダイアログを表示する
  static Future<void> showWithSettings(BuildContext context) {
    return showDialog<void>(
      context: context,
      routeSettings: const RouteSettings(name: routeName),
      builder: (context) => const RouteAwareDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('ダイアログ'),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('閉じる'),
        ),
      ],
    );
  }
}
