# flutter_tokyo_train

東京の鉄道路線とその駅情報を一覧表示し、地図上にマーカーで可視化する Flutter アプリです。

---

## 概要

外部 API から東京の鉄道路線データ（路線名・駅名・緯度経度）を取得し、路線ごとの駅一覧表示と OpenStreetMap ベースのインタラクティブな地図表示を提供します。  
JR・新幹線の除外フィルターや、選択した路線の全駅に合わせたカメラ自動フィットにも対応しています。

---

## 主な機能

- **路線・駅一覧の表示**  
  全路線を一覧表示し、各路線の駅名と緯度・経度を確認可能

- **地図表示（flutter_map）**  
  路線ごと、または全路線の駅を OpenStreetMap 上にマーカーで表示  
  選択した路線の全駅が収まるようにカメラを自動フィット

- **JR・新幹線除外フィルター**  
  AppBar のボタンで JR・新幹線路線を一括で表示／非表示に切り替え

- **タイルキャッシュ**  
  `flutter_cache_manager` によるマップタイルのローカルキャッシュ

---

## データモデル

```
TokyoTrainModel
  - trainNumber : int                    // 路線番号
  - trainName   : String                 // 路線名
  - station     : List<TokyoStationModel> // 駅リスト

TokyoStationModel
  - id          : String  // 駅 ID
  - stationName : String  // 駅名
  - address     : String  // 住所
  - lat         : double  // 緯度
  - lng         : double  // 経度
```

---

## 使用技術

| カテゴリ | ライブラリ |
|---|---|
| フレームワーク | Flutter / Dart |
| 状態管理 | [Riverpod](https://riverpod.dev/) (hooks_riverpod, riverpod_annotation) |
| HTTP 通信 | [http](https://pub.dev/packages/http) |
| 地図 | [flutter_map](https://pub.dev/packages/flutter_map) + [latlong2](https://pub.dev/packages/latlong2) |
| タイルキャッシュ | [flutter_cache_manager](https://pub.dev/packages/flutter_cache_manager), [cached_network_image](https://pub.dev/packages/cached_network_image) |
| チャート | [fl_chart](https://pub.dev/packages/fl_chart) |
| 環境変数 | [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) |
| コード生成 | build_runner, freezed, json_serializable, riverpod_generator |
| その他 | font_awesome_flutter, scroll_to_index, dotted_line |

---

## API

| 用途 | エンドポイント |
|---|---|
| 鉄道路線・駅データ取得 | `http://toyohide.work/BrainLog/api/getTokyoTrainStation` |

---

## プロジェクト構成

```
lib/
├── controllers/
│   ├── _get_data/
│   │   └── tokyo_train/   # 鉄道データ取得 (Riverpod Notifier + Freezed)
│   ├── app_param/         # アプリ状態管理 (フィルター・ズームレベルなど)
│   └── controllers_mixin.dart
├── data/
│   └── http/              # HTTP クライアント・API パス定義
├── extensions/            # Dart 拡張メソッド
├── models/                # データモデル (TokyoTrainModel, TokyoStationModel)
├── screens/
│   ├── components/        # 地図ダイアログ (TrainMapAlert)
│   ├── parts/             # 共通 UI (TokyoTrainDialog)
│   └── home_screen.dart   # ホーム画面
├── utility/               # ユーティリティ (タイルプロバイダなど)
└── main.dart
```

---

## セットアップ

### 前提条件

- Flutter SDK `^3.8.1`
- Dart SDK `^3.8.1`

### インストール

```bash
git clone https://github.com/toyotarou/flutter_tokyo_train.git
cd flutter_tokyo_train
flutter pub get
```

### 環境変数

`.env` ファイルをプロジェクトルートに作成してください（必要に応じて）。

### コード生成

Riverpod プロバイダや Freezed クラスのコードを生成します。

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 実行

```bash
flutter run
```

---

## 対応プラットフォーム

- Android
- iOS
- macOS
- Windows
- Linux

---

## ライセンス

このプロジェクトにはライセンスファイルが設定されていません。
