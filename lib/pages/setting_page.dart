import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:subscription_app/firebase_provider.dart';
import 'package:subscription_app/pages/sign_page.dart';
import 'package:subscription_app/theme_controller.dart';

import 'edit_profile_page.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final auth = ref.watch(firebaseAuthProvider);

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 60),
        const CircleAvatar(
          maxRadius: 60,
          backgroundImage: NetworkImage(
              'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2018/08/flutter-logo-400x400-320x320.png'),
        ),
        const SizedBox(height: 20),
        const Text(
          'Yosuke',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 20),
        SettingsList(
          shrinkWrap: true,
          sections: [
            SettingsSection(
              // title: const Text('Setting'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onPressed: (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const EditProfilePage(); // 遷移先の画面widgetを指定
                        },
                      ),
                    );
                  },
                ),
                SettingsTile.switchTile(
                  onToggle: (bool value) {
                    if (value) {
                      ref.read(themeModeProvider.notifier).state =
                          ThemeMode.dark;
                    } else {
                      ref.read(themeModeProvider.notifier).state =
                          ThemeMode.light;
                    }
                  },
                  initialValue: isDarkMode,
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('Dark Theme'),
                ),
              ],
            ),
            SettingsSection(tiles: [
              SettingsTile(
                  onPressed: (context) {
                    auth.signOut();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return SignPage(); // 遷移先の画面widgetを指定
                        },
                      ),
                    );
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'Sign Out',
                  )),
            ])
          ],
        ),
      ],
    ));
  }
}
