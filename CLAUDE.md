# CLAUDE.md

このファイルはClaude Codeがこのリポジトリを扱う際のガイダンスを提供します。

## プロジェクト概要

Flutter初学者向けの学習用リポジトリです。毎週課題を出題し、出題者がサンプルコードを作成して参考資料として残します。

## 開発環境

- **Flutter**: 3.38.7 (asdfで管理)
- **Dart SDK**: ^3.10.7

### セットアップ

```bash
# asdfでFlutterをインストール
./scripts/install-asdf-tool.sh

# 依存関係のインストール
flutter pub get
```

### よく使うコマンド

```bash
flutter run              # アプリを実行
flutter analyze          # 静的解析を実行
flutter test             # テストを実行
flutter pub get          # 依存関係を取得
```

## アーキテクチャ

### ディレクトリ構造

```
lib/
├── main.dart                    # エントリーポイント
├── app.dart                     # MaterialAppの設定
├── home/                        # トップページ（課題一覧画面）
│   └── home_page.dart
└── features/                    # 課題ごとのfeatureパッケージ
    └── {テーマ名}/              # 例: counter, layout, api
        ├── ui/                  # 画面・Widget
        ├── data/                # データ層（リポジトリ、データソース）
        └── domain/              # ドメイン層（モデル、ユースケース）
```

### 設計方針

- **feature単位で課題を管理**: 各課題は独立したfeatureパッケージとして実装
- **レイヤー分割**: 各featureはui/data/domain/の3層構造
- **画面遷移**: Navigation 1.0（`Navigator.push`/`Navigator.pop`）を使用
- **状態管理**: 課題のテーマに応じて適切な方法を選択（setState、Provider、Riverpod等）

### トップページの役割

トップページ（`lib/home/home_page.dart`）は各課題のトップページへ遷移するための一覧画面として実装します。新しい課題を追加したら、トップページにも遷移ボタンを追加してください。

## コーディング規約

### Lintルール

`analysis_options.yaml`で厳しめのルールを設定しています：

- `prefer_single_quotes`: シングルクォートを推奨
- `always_declare_return_types`: 戻り値の型を必ず宣言
- `require_trailing_commas`: 末尾カンマを必須
- `sort_constructors_first`: コンストラクタをクラスの先頭に配置

### 命名規則

- **ファイル名**: スネークケース（`home_page.dart`）
- **クラス名**: パスカルケース（`HomePage`）
- **変数・関数名**: キャメルケース（`userName`, `fetchData`）
- **定数**: キャメルケースまたはスクリーミングスネークケース（`maxRetryCount`または`MAX_RETRY_COUNT`）

### コメント

- コメントやドキュメントは**日本語**で記述
- 複雑なロジックには説明コメントを追加
- 公開APIにはdocコメント（`///`）を記述

## テスト

テストは任意ですが、学習目的で必要に応じて作成できます。

```
test/
└── features/
    └── {テーマ名}/
        └── *_test.dart
```

## 課題追加の手順

1. `lib/features/{テーマ名}/`ディレクトリを作成
2. ui/data/domain/サブディレクトリを必要に応じて作成
3. 課題のメイン画面を実装
4. `lib/home/home_page.dart`に遷移ボタンを追加
