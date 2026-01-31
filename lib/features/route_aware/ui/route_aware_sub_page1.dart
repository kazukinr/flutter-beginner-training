import 'package:flutter/material.dart';

import '../../../home/home_page.dart';
import 'route_aware_sub_page2.dart';

/// RouteAware課題のサブ画面1
///
/// 前画面に戻る、次の画面に遷移するの2つの選択ができる
class RouteAwareSubPage1 extends StatelessWidget {
  const RouteAwareSubPage1({super.key});

  /// ルート名
  static const routeName = '/route_aware/sub1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('サブ画面1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.looks_one,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24),
              Text(
                'サブ画面1',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '画面遷移の1つ目の遷移先です',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: const RouteSettings(
                        name: RouteAwareSubPage2.routeName,
                      ),
                      builder: (context) => const RouteAwareSubPage2(),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('次の画面に遷移する'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('前画面に戻る'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.popUntil(
                    context,
                    ModalRoute.withName(HomePage.routeName),
                  ),
                  icon: const Icon(Icons.list),
                  label: const Text('課題一覧に戻る'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
