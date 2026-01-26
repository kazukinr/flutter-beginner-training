import 'package:flutter/material.dart';
import 'package:flutter_beginner_training/features/route_aware/ui/route_aware_impl.dart';
import 'package:flutter_beginner_training/shared/route/observer.dart';

import 'route_aware_bottom_sheet.dart';
import 'route_aware_dialog.dart';
import 'route_aware_sub_page1.dart';

/// RouteAware課題のメイン画面
///
/// 各種メニューを表示し、それぞれの機能を検証できる
class RouteAwareMainPage extends StatefulWidget {
  const RouteAwareMainPage({super.key});

  /// ルート名
  static const routeName = '/route_aware';

  @override
  State<RouteAwareMainPage> createState() => _RouteAwareMainPageState();
}

class _RouteAwareMainPageState extends State<RouteAwareMainPage> {
  // ModalRouteObserverの監視結果を購読
  final modalRouteAware = const RouteAwareImpl(tag: 'ModalRoute');

  // PageRouteObserverの監視結果を購読
  final pageRouteAware = const RouteAwareImpl(tag: 'PageRoute');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // RouteObserverを購読
    final route = ModalRoute.of(context);
    if (route != null) {
      debugPrint('[ModalRoute] 購読開始');
      modalRouteObserver.subscribe(modalRouteAware, route);
      if (route is PageRoute) {
        debugPrint('[PageRoute] 購読開始');
        pageRouteObserver.subscribe(pageRouteAware, route);
      }
    }
  }

  @override
  void dispose() {
    debugPrint('[ModalRoute] 購読終了');
    modalRouteObserver.unsubscribe(modalRouteAware);
    debugPrint('[PageRoute] 購読終了');
    pageRouteObserver.unsubscribe(pageRouteAware);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RouteAware検証'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MenuCard(
            title: '画面遷移',
            description: 'Navigator.pushで別画面に遷移します',
            icon: Icons.arrow_forward,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                settings: const RouteSettings(
                  name: RouteAwareSubPage1.routeName,
                ),
                builder: (context) => const RouteAwareSubPage1(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            title: 'ボトムシート表示',
            description: 'showModalBottomSheetでボトムシートを表示します',
            icon: Icons.vertical_align_bottom,
            onTap: () => RouteAwareBottomSheet.show(context),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            title: 'ダイアログ表示',
            description: 'showDialogでダイアログを表示します',
            icon: Icons.crop_square,
            onTap: () => RouteAwareDialog.show(context),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            title: 'ボトムシート表示（RouteSettings付き）',
            description: 'routeSettingsを指定してボトムシートを表示します',
            icon: Icons.vertical_align_bottom,
            onTap: () => RouteAwareBottomSheet.showWithSettings(context),
          ),
          const SizedBox(height: 12),
          _MenuCard(
            title: 'ダイアログ表示（RouteSettings付き）',
            description: 'routeSettingsを指定してダイアログを表示します',
            icon: Icons.crop_square,
            onTap: () => RouteAwareDialog.showWithSettings(context),
          ),
          // 新しいメニューはここに追加してください
        ],
      ),
    );
  }
}

/// メニューカード
class _MenuCard extends StatelessWidget {
  const _MenuCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
