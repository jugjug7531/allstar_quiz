import 'package:allstar_quiz/lobby/component/participant_list.dart';
import 'package:allstar_quiz/login/model/participant_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// ロビー画面
/// 参加登録後にクイズ開始まで待機するページ
class LobbyPage extends StatelessWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ロビー'),
      ),
      body: Column(
        children: [
          const Text(
            "クイズ開始まで\nしばらくお待ちください",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text("参加者一覧"),
          // 参加者一覧リスト
          Expanded(
              child: Consumer<ParticipantModel>(
                  builder: (context, participantModel, _) =>
                      const ParticipantList()))
        ],
      ),
    );
  }
}
