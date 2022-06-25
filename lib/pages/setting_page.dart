import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:subscription_app/theme_controller.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('Setting'),
              tiles: <SettingsTile>[
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
          ],
        ));
  }
}
