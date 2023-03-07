import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final authRepositoryProvider = Provider.autoDispose<BaseRepository>(
    (ref) => BaseRepository(firebaseAuth: ref.read(firebaseAuthProvider)));

class BaseRepository {
  BaseRepository({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  final FirebaseAuth _firebaseAuth;
}
