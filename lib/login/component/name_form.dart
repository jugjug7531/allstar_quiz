import 'package:allstar_quiz/login/model/participant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 名前入力フォーム
///
/// クイズで使用する名前を入力するためのフォームWidget
class NameForm extends StatelessWidget {
  const NameForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: const InputDecoration(labelText: '名前'),
        onChanged: (String value) {
          // 参加者情報モデル取得
          final participantModel =
              Provider.of<ParticipantModel>(context, listen: false);
          participantModel.name = value;
        });
  }
}
