import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final fireStoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final fireStorageProvider =
    Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);
