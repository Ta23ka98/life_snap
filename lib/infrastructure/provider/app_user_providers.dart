import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final userCollectionReferenceProvider =
    Provider.autoDispose<CollectionReference<Map<String, dynamic>>>((ref) {
  final collectionReference = ref.read(fireStoreProvider).collection("users");
  return collectionReference;
});
