import 'package:allstar_quiz/login/model/participant_model.dart';
import 'package:allstar_quiz/login/ui/signup_page.dart';
import 'package:allstar_quiz/my_firebase_option.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // 初期化処理を追加
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: MyFirebaseOption.apiKey,
      projectId: MyFirebaseOption.projectId,
      messagingSenderId: MyFirebaseOption.messagingSenderId,
      appId: MyFirebaseOption.appId,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ParticipantModel>(
          create: (context) => ParticipantModel(),
        ),
      ],
      child: const MaterialApp(
        home: AllstarQuiz(),
      ),
    ),
  );
}

class AllstarQuiz extends StatelessWidget {
  const AllstarQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'AllstarQuiz',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
      ),
      // 参加登録画面を表示
      home: const SignupPage(),
    );
  }
}
