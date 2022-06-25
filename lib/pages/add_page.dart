import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:subscription_app/firebase_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../models/subscription.dart';

const uuid = Uuid();

final billingIntervalProvider =
    StateProvider<BillingInterval>((ref) => BillingInterval.monthly);
StateProvider<DateTime> startAtProvider =
    StateProvider((ref) => DateTime.now());
StateProvider<DateTime> billingAtProvider =
    StateProvider((ref) => DateTime.now());

class AddPage extends ConsumerWidget {
  AddPage({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startAt = ref.watch(startAtProvider);
    final billingAt = ref.watch(billingAtProvider);
    final billingInterval = ref.watch(billingIntervalProvider);
    final user = ref.watch(firebaseAuthProvider).currentUser;
    final instance = ref.watch(firebaseFirestoreProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "サービス名"),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "価格"),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Radio(
                      value: BillingInterval.monthly,
                      groupValue: billingInterval,
                      onChanged: (value) {
                        ref.read(billingIntervalProvider.notifier).state =
                            BillingInterval.monthly;
                      },
                    ),
                    const Text('月額')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio(
                      value: BillingInterval.yearly,
                      groupValue: billingInterval,
                      onChanged: (BillingInterval? value) {
                        ref.read(billingIntervalProvider.notifier).state =
                            BillingInterval.yearly;
                      },
                    ),
                    const Text('年額')
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(DateFormat('yyyy/MM/dd').format(startAt)),
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2050, 12, 31),
                          currentTime: startAt, onConfirm: (date) {
                        ref.read(startAtProvider.notifier).state = date;
                      }, locale: LocaleType.jp);
                    },
                    child: const Text(
                      '追加日',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            Row(
              children: [
                Text(DateFormat('yyyy/MM/dd').format(billingAt)),
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2000, 1, 1),
                          maxTime: DateTime(2050, 12, 31),
                          currentTime: billingAt, onConfirm: (date) {
                        ref.read(billingAtProvider.notifier).state = date;
                      }, locale: LocaleType.jp);
                    },
                    child: const Text(
                      '支払日',
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Subscription subscription = Subscription(
                      id: uuid.v4(),
                      name: nameController.text,
                      price: int.parse(priceController.text),
                      billingInterval: billingInterval,
                      createdAt: DateTime.now(),
                      startAt: startAt,
                      billingAt: billingAt);
                  instance
                      .collection('users')
                      .doc(user!.uid)
                      .collection('subscriptions')
                      .add(subscription.toJson());
                  nameController.clear();
                  priceController.clear();
                  Navigator.pop(context);
                },
                child: const Text('追加')),
          ],
        ),
      ),
    );
  }
}
