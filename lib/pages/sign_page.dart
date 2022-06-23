import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/firebase_provider.dart';
import 'package:subscription_app/models/user.dart';
import 'package:subscription_app/pages/root_page.dart';

final infoTextStateProvider = StateProvider.autoDispose((ref) => '');

final userProvider = StateProvider((ref) {
  return fbauth.FirebaseAuth.instance.currentUser;
});

class SignPage extends HookConsumerWidget {
  SignPage({Key? key}) : super(key: key);

  String newUserEmail = "";
  String newUserPassword = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);
    final infoText = ref.watch(infoTextStateProvider);
    final instance = ref.watch(firebaseFirestoreProvider);

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
            //入力フォーム
            TextFormField(
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (String value) {
                newUserEmail = value;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) {
                newUserPassword = value;
              },
            ),
            const SizedBox(height: 8),
            //SignInボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final result = await auth.signInWithEmailAndPassword(
                      email: newUserEmail,
                      password: newUserPassword,
                    );

                    ref.watch(userProvider.notifier).state = result.user;

                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return const RootPage();
                      }),
                    );
                  } catch (e) {
                    ref.read(infoTextStateProvider.notifier).state =
                        "ログイン失敗: ${e.toString()}";
                  }
                },
                child: const Text("Sign In"),
              ),
            ),
            //SignUpボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final fbauth.UserCredential result =
                        await auth.createUserWithEmailAndPassword(
                      email: newUserEmail,
                      password: newUserPassword,
                    );
                    ref.read(userProvider.notifier).state = result.user;
                    String userId = result.user!.uid;
                    User user = User(
                        uid: userId,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now());

                    instance
                        .collection('users')
                        .doc(user.uid)
                        .set(user.toJson());

                    ref.read(infoTextStateProvider.notifier).state =
                        "登録成功: ${result.user!.email}";
                  } catch (e) {
                    ref.read(infoTextStateProvider.notifier).state =
                        "登録失敗: ${e.toString()}";
                  }
                },
                child: const Text("Sign Up"),
              ),
            ),

            const SizedBox(height: 8),
            Text(infoText),
          ],
        ),
      ),
    );
  }
}
