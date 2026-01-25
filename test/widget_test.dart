import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_beginner_training/app.dart';

void main() {
  testWidgets('ホーム画面が表示される', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // タイトルが表示されることを確認
    expect(find.text('Flutter Beginner Training'), findsOneWidget);

    // 課題一覧セクションが表示されることを確認
    expect(find.text('課題一覧'), findsOneWidget);
  });
}
