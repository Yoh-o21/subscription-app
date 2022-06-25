import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/models/user.dart';

class UserStateNotifier extends StateNotifier<User?> {
  UserStateNotifier({User? currentUser}) : super(currentUser);

  final auth = fbauth.FirebaseAuth.instance;
  final instance = FirebaseFirestore.instance;

  signIn(String email, String password) async {
    final result = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return result;
  }

  signUp(String email, String password) async {
    final result = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = User(
        uid: result.user!.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    instance.collection('users').doc(user.uid).set(user.toJson());

    return result;
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, User?>(
  (ref) => UserStateNotifier(currentUser: null),
);
