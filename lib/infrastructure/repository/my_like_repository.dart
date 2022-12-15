import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/my_like/my_like.dart';
import 'package:life_snap/infrastructure/provider/app_user_providers.dart';

final myLikeRepositoryProvider =
    Provider.autoDispose<MyLikeRepository>((ref) {
  return MyLikeRepository(
      collectionReference: ref.read(userCollectionReferenceProvider));
});

abstract class BaseMyLikeRepository {
  CollectionReference getCollectionRef({required String uid});
  Future<List<MyLike>> getMyLikes({required String uid});
  Future<void> insert({required String uid, required MyLike myLike});
  Future<void> delete({required uid, required String id});
}

class MyLikeRepository implements BaseMyLikeRepository {
  MyLikeRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  CollectionReference getCollectionRef({required String uid}) {
    return _collectionReference.doc(uid).collection("my_likes");
  }

  @override
  Future<List<MyLike>> getMyLikes({required String uid}) async {
    final myLikeRef = getCollectionRef(uid: uid);
    final snapshot = await myLikeRef.get();
    return snapshot.docs.map((doc) {
      return MyLike.fromDocument(doc);
    }).toList();
  }

  @override
  Future<void> insert({required String uid, required MyLike myLike}) async {
    final myLikeRef = getCollectionRef(uid: uid);
    await myLikeRef.doc(myLike.id).set(myLike.toJson());
  }

  @override
  Future<void> delete({required uid, required String id}) async {
    final myLikeRef = getCollectionRef(uid: uid);
    await myLikeRef.doc(id).delete();
  }
}
