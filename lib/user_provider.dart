import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:subscription_app/models/date_time_converter.dart';
import 'package:subscription_app/models/user.dart';

class UserStateNotifier extends StateNotifier<User?> {
  UserStateNotifier() : super(null);

  final current = auth.FirebaseAuth.instance.currentUser;
  final collection = FirebaseFirestore.instance.collection('users');

  void signUp(email, password) async {
    final result =
        await auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = User(
        uid: result.user!.uid,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());

    collection.doc(user.uid).set(user.toJson());
    state = user;
  }

  void signIn(email, password) async {
    final result = await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final snapshot = await collection.doc(result.user!.uid).snapshots().first;
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    User user = User.fromJson(data);
    state = user;
  }

  // void update() {
  //   state = state.copyWith();
  //   final user = state.toJson();
  //   collection.doc(current?.uid).update(user);
  // }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, User?>(
  (ref) => UserStateNotifier(),
);
