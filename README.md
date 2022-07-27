# allstar_quiz

オールスター感謝祭形式のクイズアプリを作成する。

## Firebaseの設定

事前にFirebaseでプロジェクトを作成しておく必要がある。  
`lib/my_firebase_option.dart`を作成して以下の内容を記述すること。  
```dart
/// firebaseオプション
/// 
/// Firebase.initializeApp()の引数に必要な情報を保持する。
/// 
/// アプリ動作前に各メンバに必要情報を設定する必要あり。
class MyFirebaseOption {
  /// ウェブAPIキー
  static const String apiKey = "【 your apiKey 】";
  /// プロジェクトID
  static const String projectId = "【 your projectId 】";
  /// プロジェクト番号
  static const String messagingSenderId = "【 your messagingSenderId 】";
  /// アプリID
  static const String appId = "【 your appId 】";
}
```