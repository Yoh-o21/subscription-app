import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/date_time_extention.dart';
import 'package:subscription_app/firebase_provider.dart';
import 'package:subscription_app/models/subscription.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(firebaseAuthProvider).currentUser;
    final snapshots = ref
        .watch(firebaseFirestoreProvider)
        .collection('users')
        .doc(user?.uid)
        .collection('subscriptions')
        .orderBy('billingAt')
        .snapshots();

    return Scaffold(
      body: Center(
        child: StreamBuilder(
          stream: snapshots,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('取得できませんでした'),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Loading"),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                Subscription subscription = Subscription.fromJson(data);
                return Card(
                  child: ListTile(
                    title: Text(subscription.name),
                    subtitle: Text('¥${subscription.price}'),
                    trailing: Text(
                        subscription.billingAt.toFormattedString('yyyy年M月d日')),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
