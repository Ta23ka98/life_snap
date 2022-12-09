import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/my_post/my_post.dart';

import '../provider/app_user_providers.dart';

final myPostRepositoryProvider = Provider.autoDispose<MyPostRepository>((ref) {
  return MyPostRepository(
      collectionReference: ref.read(userCollectionReferenceProvider));
});

abstract class BaseMyPostRepository {
  CollectionReference getCollectionRef({required String uid});
  Future<List<String>> getIds({required String uid});
  Future<void> insert(
      {required String uid, required String id, required MyPost myPost});
  Future<void> delete({required String uid, required String id});
  Future<void> deleteAll({required List<String> ids, required String uid});
}

class MyPostRepository implements BaseMyPostRepository {
  MyPostRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  CollectionReference getCollectionRef({required String uid}) {
    return _collectionReference.doc(uid).collection("myPosts");
  }

  @override
  Future<List<String>> getIds({required String uid}) async {
    final myPostRef = getCollectionRef(uid: uid);
    // 作成日時順に並び替えてIDを取得
    final snapshot =
        await myPostRef.orderBy('createdAt', descending: true).get();
    return snapshot.docs.map((doc) {
      return doc.id;
    }).toList();
  }

  @override
  Future<void> insert(
      {required String uid, required String id, required MyPost myPost}) async {
    final myPostRef = getCollectionRef(uid: uid);
    await myPostRef.doc(id).set(myPost.toJson());
  }

  @override
  Future<void> delete({required String uid, required String id}) async {
    final myPostRef = getCollectionRef(uid: uid);
    await myPostRef.doc(id).delete();
  }

  @override
  Future<void> deleteAll(
      {required List<String> ids, required String uid}) async {
    for (var id in ids) {
      await delete(uid: uid, id: id);
    }
  }
}
