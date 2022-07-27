import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

/// 参加者一覧リスト
///
/// クイズの参加者を一覧で表示する
class ParticipantList extends StatelessWidget {
  const ParticipantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // 参加者一覧を取得（非同期処理）
      // 参加登録日時でソート
      stream: FirebaseFirestore.instance
          .collection('users')
          .orderBy('date')
          .snapshots(),
      builder: (context, snapshot) {
        // データが取得できた場合
        if (snapshot.hasData) {
          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          // 取得した参加者一覧をリスト表示
          return ListView(
            children: documents.map((document) {
              return Card(
                child: ListTile(
                  title: Text(document['name']),
                ),
              );
            }).toList(),
          );
        }
        // データが読込中の場合
        return const Center(
          child: Text('読込中...'),
        );
      },
    );
  }
}
