import 'package:allstar_quiz/lobby/ui/lobby_page.dart';
import 'package:allstar_quiz/login/model/participant_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// 参加ボタン
///
/// 名前を決めてクイズに参加するときに押すボタンWidget
class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('参加'),
      onPressed: () async {
        // 参加者情報モデル取得
        final participantModel =
            Provider.of<ParticipantModel>(context, listen: false);

        // 現在の日時取得
        final date = DateFormat('yyyy-MM-dd(E) HH:mm:ss')
            .format(DateTime.now().toLocal());

        try {
          // 名前のみでユーザー登録
          final FirebaseAuth auth = FirebaseAuth.instance;
          await auth.signInAnonymously();
          // ユーザー登録に成功した場合
          // ユーザー情報をfirestoreに保存
          await FirebaseFirestore.instance
              .collection('users') // コレクションID指定
              .doc() // ドキュメントID自動生成
              .set({
            'name': participantModel.name,
            'date': date,
          });
          // ロビー画面に遷移＋参加登録画面を破棄
          await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) {
              return const LobbyPage();
            }),
          );
        } catch (e) {
          // ユーザー登録に失敗した場合
          participantModel.errorMsg = "登録に失敗しました：${e.toString()}";
        }
      },
    );
  }
}
