import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/screens/root_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String newUserEmail = "";
  String newUserPassword = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: "メールアドレス"),
                onChanged: (String value) {
                  setState(() {
                    newUserEmail = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: "パスワード（６文字以上）"),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    newUserPassword = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //ユーザー登録ボタン
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final UserCredential result =
                            await auth.createUserWithEmailAndPassword(
                          email: newUserEmail,
                          password: newUserPassword,
                        );

                        final User user = result.user!;
                        setState(() {
                          infoText = "登録成功: ${user.email}";
                        });
                      } catch (e) {
                        setState(() {
                          infoText = "登録失敗: ${e.toString()}";
                        });
                      }
                    },
                    child: const Text("ユーザー登録"),
                  ),
                  //ログインボタン
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final result = await auth.signInWithEmailAndPassword(
                          email: newUserEmail,
                          password: newUserPassword,
                        );

                        await Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                            return RootPage(result.user!);
                          }),
                        );
                      } catch (e) {
                        setState(() {
                          infoText = "ログイン失敗: ${e.toString()}";
                        });
                      }
                    },
                    child: const Text("ログイン"),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(infoText),
            ],
          ),
        ),
      ),
    );
  }
}
