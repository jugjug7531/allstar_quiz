import 'package:flutter/foundation.dart';

/// 参加者情報モデル
///
/// 以下の情報を保持
/// ・名前[_name]
/// ・参加登録エラーメッセージ[_errorMsg]
class ParticipantModel with ChangeNotifier {
  /// 名前
  String _name = "";

  /// 参加登録エラーメッセージ
  String _errorMsg = "";

  // getter
  String get name => _name;
  String get errorMsg => _errorMsg;

  // setter
  set name(String name) {
    _name = name;
    notifyListeners(); //通知
  }

  set errorMsg(String errorMsg) {
    _errorMsg = errorMsg;
    notifyListeners(); //通知
  }
}
