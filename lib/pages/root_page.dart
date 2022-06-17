import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/pages/setting_page.dart';

import 'add_page.dart';
import 'home_page.dart';

enum PageType { home, setting }

final pageTypeProvider = StateProvider<PageType>((ref) => PageType.home);

class RootPage extends HookConsumerWidget {
  const RootPage(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageType = ref.watch(pageTypeProvider);
    final pages = [
      HomePage(user),
      SettingPage(user),
    ];
    return Scaffold(
      body: pages[pageType.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageType.index,
        onTap: (int selectIndex) {
          ref.read(pageTypeProvider.notifier).state =
              PageType.values[selectIndex];
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddPage(user);
            }),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
