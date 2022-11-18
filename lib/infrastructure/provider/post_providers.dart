import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final postCollectionReferenceProvider =
    Provider.autoDispose<CollectionReference<Map<String, dynamic>>>((ref) {
  final collectionReference = ref.read(fireStoreProvider).collection("posts");
  return collectionReference;
});

final postsReferenceWithConverterProvider = Provider.autoDispose((ref) {
  printLog(value: "postsReferenceWithConverterProvider init");
  ref.onDispose(
      () => printLog(value: "postsReferenceWithConverterProvider dispose"));
  return ref.read(postCollectionReferenceProvider).withConverter<Post>(
        fromFirestore: (docs, _) => Post.fromDocument(docs),
        toFirestore: ((post, _) {
          return post.toJson();
        }),
      );
});

final postsStreamProvider = StreamProvider<QuerySnapshot<Post>>((ref) {
  // return ref.read(postsReferenceWithConverterProvider).orderBy('createdAt').snapshots();
  return ref.read(postsReferenceWithConverterProvider).snapshots();
});

final postStreamProvider =
    StreamProvider.family<DocumentSnapshot<Post>, String>((ref, id) {
  // return ref.read(postsReferenceWithConverterProvider).orderBy('createdAt').snapshots();
  return ref.read(postsReferenceWithConverterProvider).doc(id).snapshots();
});

final postsFutureProvider = FutureProvider<QuerySnapshot<Post>>((ref) {
  // return ref.read(postsReferenceWithConverterProvider).orderBy('createdAt').get();
  return ref.read(postsReferenceWithConverterProvider).get();
});

final postFutureProvider =
    FutureProvider.family<DocumentSnapshot<Post>, String>((ref, id) {
  // return ref.read(postsReferenceWithConverterProvider).orderBy('createdAt').get();
  return ref.read(postsReferenceWithConverterProvider).doc(id).get();
});
