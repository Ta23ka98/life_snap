import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final authStreamProvider = StreamProvider((ref) {
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return firebaseAuth.userChanges();
});

final userProvider = Provider<User?>((ref) {
  final user = ref.watch(authStreamProvider).value;
  if (user == null) {
    return null;
  }
  return user;
});
