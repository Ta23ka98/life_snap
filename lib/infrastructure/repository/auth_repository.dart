import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
    (ref) => AuthRepository(firebaseAuth: ref.read(firebaseAuthProvider)));

abstract class BaseAuthRepository {}

class AuthRepository implements BaseAuthRepository {
  AuthRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;
}
