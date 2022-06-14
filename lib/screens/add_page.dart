import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/subscription.dart';

const uuid = Uuid();

final billingIntervalProvider =
    StateProvider<BillingInterval>((ref) => BillingInterval.monthly);

class AddPage extends HookConsumerWidget {
  AddPage(this.user, {Key? key}) : super(key: key);
  final User user;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final billingInterval = ref.watch(billingIntervalProvider);

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
            Row(
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
            ElevatedButton(
                onPressed: () {
                  // Subscription subscription = Subscription(id: uuid.v4(), name: nameController.text, billingInterval: intervalController.text, createdAt: createdAt, startAt: startAt, billingAt: billingAt, price: price, isSubscribed: isSubscribed)
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(user.uid)
                      .collection('subscriptions')
                      .add(
                    {
                      'name': nameController.text,
                      'billingInterval': billingInterval.name
                    },
                  );
                  nameController.clear();
                  Navigator.pop(context);
                },
                child: const Text('追加')),
          ],
        ),
      ),
    );
  }
}
