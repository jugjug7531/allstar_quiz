import 'package:allstar_quiz/login/component/add_user_button.dart';
import 'package:allstar_quiz/login/component/name_form.dart';
import 'package:allstar_quiz/login/model/participant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 参加登録ページ
///
/// 参加登録をおこなうページ
class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("オールスター感謝祭クイズ"),
        ),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // 名前入力フォーム
                          const NameForm(),
                          // エラーメッセージ
                          Container(
                              padding: const EdgeInsets.all(8),
                              child: Consumer<ParticipantModel>(
                                builder: (context, participantModel, _) => Text(
                                  participantModel.errorMsg,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              )),
                          // 新規ユーザ登録ボタン
                          const SizedBox(
                              width: double.infinity, child: AddUserButton()),
                        ],
                      ),
                    ]))));
  }
}
