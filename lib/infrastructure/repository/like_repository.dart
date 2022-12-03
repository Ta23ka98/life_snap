import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/like/like.dart';

import '../provider/app_user_providers.dart';

final likeRepositoryProvider = Provider.autoDispose<LikeRepository>((ref) {
  return LikeRepository(
      collectionReference: ref.read(userCollectionReferenceProvider));
});

abstract class BaseLikeRepository {
  CollectionReference getCollectionRef({required String uid});
  Future<String> getId({required String uid, required String id});
  Future<bool> isLikes({required String uid, required String id});
  Future<List<String>> getIds({required String uid});
  Future<void> insert(
      {required String uid, required String id, required Like like});
  Future<void> delete({required String uid, required String id});
  Future<void> deleteAll({required List<String> ids, required String uid});
}

class LikeRepository implements BaseLikeRepository {
  LikeRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  CollectionReference getCollectionRef({required String uid}) {
    return _collectionReference.doc(uid).collection("myLikes");
  }

  @override
  Future<bool> isLikes({required String uid, required String id}) async {
    final likeRef = getCollectionRef(uid: uid);
    final docs = await likeRef.doc(id).get();
    if (docs.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> getId({required String uid, required String id}) async {
    final likeRef = getCollectionRef(uid: uid);
    final docs = await likeRef.doc(id).get();
    return docs.id;
  }

  @override
  Future<List<String>> getIds({required String uid}) async {
    final likeRef = getCollectionRef(uid: uid);
    final snapshot = await likeRef.get();
    return snapshot.docs.map((doc) {
      return doc.id;
    }).toList();
  }

  @override
  Future<void> insert(
      {required String uid, required String id, required Like like}) async {
    final likeRef = getCollectionRef(uid: uid);
    await likeRef.doc(id).set(like.toJson());
  }

  @override
  Future<void> delete({required String uid, required String id}) async {
    final likeRef = getCollectionRef(uid: uid);
    await likeRef.doc(id).delete();
  }

  @override
  Future<void> deleteAll(
      {required List<String> ids, required String uid}) async {
    for (var id in ids) {
      await delete(uid: uid, id: id);
    }
  }
}
