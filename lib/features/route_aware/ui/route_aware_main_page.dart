import 'package:flutter/material.dart';

/// RouteAware課題のメイン画面
///
/// 各種メニューを表示し、それぞれの機能を検証できる
class RouteAwareMainPage extends StatelessWidget {
  const RouteAwareMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RouteAware検証'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _MenuCard(
            title: '画面遷移',
            description: 'Navigator.pushで別画面に遷移します',
            icon: Icons.arrow_forward,
          ),
          SizedBox(height: 12),
          _MenuCard(
            title: 'ボトムシート表示',
            description: 'showModalBottomSheetでボトムシートを表示します',
            icon: Icons.vertical_align_bottom,
          ),
          SizedBox(height: 12),
          _MenuCard(
            title: 'ダイアログ表示',
            description: 'showDialogでダイアログを表示します',
            icon: Icons.crop_square,
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
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // TODO: 各メニューの処理を実装
        },
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
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
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
