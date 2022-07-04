import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/models/date_time_converter.dart';
import 'package:subscription_app/models/user.dart';

class UserStateNotifier extends StateNotifier<User?> {
  UserStateNotifier() : super(null);

  final collection = FirebaseFirestore.instance.collection('users');

  void signIn(String email, String password) async {
    final result = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final snapshot = await collection.doc(result.user!.uid).snapshots().first;
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    state = User.fromJson(data);
  }

  void signUp(String email, String password) async {
    final result =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = User(
        uid: result.user!.uid,
        userImg: '',
        userName: result.user!.email!.split('@')[0],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    await collection.doc(user.uid).set(user.toJson());
    state = user;
  }

  void update(String userName) {
    state = state?.copyWith(userName: userName);
    final user = state?.toJson();
    collection.doc(state?.uid).update(user!);
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, User?>(
  (ref) => UserStateNotifier(),
);
