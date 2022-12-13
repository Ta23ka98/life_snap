import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/like/like.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';

final likeRepositoryProvider = Provider.autoDispose<LikeRepository>((ref) {
  return LikeRepository(
      collectionReference: ref.read(postCollectionReferenceProvider));
});

abstract class BaseLikeRepository {
  CollectionReference getCollectionRef({required String id});
  Future<String> getId({required String uid, required String id});
  Future<bool> isLikes({required String uid,required String id});
  Future<List<String>> getIds({required String id});
  Future<void> insert(
      {required String uid, required String id, required Like like});
  Future<void> delete({required uid, required String id});
  Future<void> deleteAll({required id, required List<String> uids});
}

class LikeRepository implements BaseLikeRepository {
  LikeRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  CollectionReference getCollectionRef({required String id}) {
    return _collectionReference.doc(id).collection("likes");
  }

  @override
  Future<bool> isLikes({required String uid,required String id}) async {
    final likeRef = getCollectionRef(id: id);
    final docs = await likeRef.doc(uid).get();
    if (docs.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> getId({required String uid, required String id}) async {
    final likeRef = getCollectionRef(id: id);
    final docs = await likeRef.doc(uid).get();
    return docs.id;
  }

  @override
  Future<List<String>> getIds({required String id}) async {
    final likeRef = getCollectionRef(id: id);
    final snapshot = await likeRef.get();
    return snapshot.docs.map((doc) {
      return doc.id;
    }).toList();
  }

  @override
  Future<void> insert(
      {required String uid, required String id, required Like like}) async {
    final likeRef = getCollectionRef(id: id);
    await likeRef.doc(uid).set(like.toJson());
  }

  @override
  Future<void> delete({required uid, required String id}) async {
    final likeRef = getCollectionRef(id: id);
    await likeRef.doc(uid).delete();
  }

  @override
  Future<void> deleteAll({required id, required List<String> uids}) async {
    for (var uid in uids) {
      await delete(uid: uid, id: id);
    }
  }
}
