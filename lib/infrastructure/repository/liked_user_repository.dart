import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/liked_user/liked_user.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';

final likedUserRepositoryProvider =
    Provider.autoDispose<LikedUserRepository>((ref) {
  return LikedUserRepository(
      collectionReference: ref.read(postCollectionReferenceProvider));
});

abstract class BaseLikedUserRepository {
  CollectionReference getCollectionRef({required String id});
  // Future<String> getId({required String uid, required String id});
  Future<bool> isLikes({required String uid, required String id});
  Future<List<LikedUser>> getLikedUser({required String id});
  Future<void> insert({required String id, required LikedUser likedUser});
  Future<void> delete({required uid, required String id});
  Future<void> deleteAll({required id, required List<LikedUser> likedUsers});
}

class LikedUserRepository implements BaseLikedUserRepository {
  LikedUserRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  CollectionReference getCollectionRef({required String id}) {
    return _collectionReference.doc(id).collection("likedUsers");
  }

  @override
  Future<bool> isLikes({required String uid, required String id}) async {
    final likedUsersRef = getCollectionRef(id: id);
    final docs = await likedUsersRef.doc(uid).get();
    if (docs.data() != null) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // Future<String> getId({required String uid, required String id}) async {
  //   final likedUsersRef = getCollectionRef(id: id);
  //   final docs = await likedUsersRef.doc(uid).get();
  //   return docs.id;
  // }

  @override
  Future<List<LikedUser>> getLikedUser({required String id}) async {
    final likedUsersRef = getCollectionRef(id: id);
    final snapshot = await likedUsersRef.get();
    return snapshot.docs.map((doc) {
      return LikedUser.fromDocument(doc);
    }).toList();
  }

  @override
  Future<void> insert(
      {required String id, required LikedUser likedUser}) async {
    final likedUsersRef = getCollectionRef(id: id);
    await likedUsersRef.doc(likedUser.id!).set(likedUser.toJson());
  }

  @override
  Future<void> delete({required uid, required String id}) async {
    final likedUsersRef = getCollectionRef(id: id);
    await likedUsersRef.doc(uid).delete();
  }

  @override
  Future<void> deleteAll(
      {required id, required List<LikedUser> likedUsers}) async {
    for (var likedUser in likedUsers) {
      await delete(uid: likedUser.id, id: id);
    }
  }
}
