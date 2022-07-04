import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:subscription_app/pages/sign_page.dart';
import 'package:subscription_app/theme_controller.dart';
import 'package:subscription_app/user_provider.dart';

import 'edit_profile_page.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final user = ref.watch(userStateNotifierProvider)!;

    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 60),
        CircleAvatar(
          maxRadius: 60,
          backgroundImage: NetworkImage(user.userImg),
        ),
        const SizedBox(height: 20),
        Text(
          user.userName,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 20),
        SettingsList(
          shrinkWrap: true,
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit Profile'),
                  onPressed: (value) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const EditProfilePage();
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
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Are you sure to sign out?'),
                          actions: [
                            CupertinoDialogAction(
                              child: const Text("Cancel"),
                              onPressed: () => Navigator.pop(context),
                            ),
                            CupertinoDialogAction(
                              child: const Text("OK"),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignPage();
                                  },
                                ),
                              ),
                            )
                          ],
                        );
                      },
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
