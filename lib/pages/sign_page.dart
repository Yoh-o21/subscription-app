import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:subscription_app/pages/root_page.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String newUserEmail = "";
  String newUserPassword = "";
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Sign In',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (String value) {
                setState(() {
                  newUserEmail = value;
                });
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) {
                setState(() {
                  newUserPassword = value;
                });
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
                child: const Text("Sign In"),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
                child: const Text("Sign Up"),
              ),
            ),
            //ログインボタン

            const SizedBox(height: 8),
            Text(infoText),
          ],
        ),
      ),
    );
  }
}
