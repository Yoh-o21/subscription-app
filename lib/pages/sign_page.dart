import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/firebase_provider.dart';
import 'package:subscription_app/pages/root_page.dart';
import 'package:subscription_app/provider.dart';
import 'package:subscription_app/user_provider.dart';

final userProvider =
    StateProvider((ref) => ref.watch(firebaseAuthProvider).currentUser);

class SignPage extends ConsumerWidget {
  SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoText = ref.watch(infoTextStateProvider);
    final email = ref.watch(emailStateProvider);
    final password = ref.watch(emailStateProvider);
    final userStateNotifier = ref.watch(userStateNotifierProvider.notifier);

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
                ref.read(emailStateProvider.state).state = value;
              },
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
              onChanged: (String value) {
                ref.read(passwordStateProvider.state).state = value;
              },
            ),
            const SizedBox(height: 8),
            //SignInボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    final result =
                        await userStateNotifier.signIn(email, password);
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
                    final result =
                        await userStateNotifier.signUp(email, password);
                    ref.read(userProvider.notifier).state = result.user;

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
