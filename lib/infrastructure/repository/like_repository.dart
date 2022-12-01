import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/like/like.dart';
import 'package:life_snap/infrastructure/provider/like_providers.dart';

final likeRepositoryProvider = Provider.autoDispose<LikeRepository>((ref) {
  return LikeRepository(
      collectionReference: ref.read(likeCollectionReferenceProvider("")));
});

abstract class BaseLikeRepository {
  DocumentReference getDocumentRef();
  Future<List<String>> getIds();
  Future<Like> insert({required Like like});
  Future<void> delete({required String id});
  Future<void> deleteAll();
}

class LikeRepository implements BaseLikeRepository {
  LikeRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  DocumentReference getDocumentRef() {
    return _collectionReference.doc();
  }

  @override
  Future<List<String>> getIds() async {
    final snapshot = await _collectionReference.get();
    return snapshot.docs.map((doc) {
      return doc.id;
    }).toList();
  }

  @override
  Future<Like> insert({required Like like}) async {
    await _collectionReference.add(like);
    final docs = await _collectionReference.doc(like.id).get();
    return Like.fromDocument(docs);
  }

  @override
  Future<void> delete({required String id}) async {
    await _collectionReference.doc(id).delete();
  }

  @override
  Future<void> deleteAll() async {
    final ids = await getIds();
    for (var id in ids) {
      await delete(id: id);
    }
  }
}
