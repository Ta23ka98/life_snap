import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/infrastructure/provider/app_user_providers.dart';

final likeCollectionReferenceProvider = Provider.family
    .autoDispose<CollectionReference<Map<String, dynamic>>, String>((ref, uid) {
  printLog(value: "likeCollectionReferenceProvider init");
  ref.onDispose(
      () => printLog(value: "likeCollectionReferenceProvider dispose"));
  final collectionReference =
      ref.read(userCollectionReferenceProvider).doc(uid).collection("myLikes");
  return collectionReference;
});
