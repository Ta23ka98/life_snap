import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';

import '../../domain/entity/my_like/my_like.dart';

final postRepositoryProvider = Provider.autoDispose<PostRepository>((ref) =>
    PostRepository(
        collectionReference: ref.read(postCollectionReferenceProvider)));

abstract class BasePostRepository {
  DocumentReference getDocumentRef();
  Future<Post?> getData({required String id});
  Future<void> insert({required Post post});
  Future<void> update({required Post post});
  Future<void> delete({required String id});
  Future<void> deleteAll({required List<String> ids});
  Stream<List<DocumentSnapshot>> getSearchPost({required Position position});
  Future<List<Post>> getMyLike({required List<MyLike> myLikes});
}

class PostRepository implements BasePostRepository {
  PostRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;
  late GeoFlutterFire geo;

  @override
  DocumentReference getDocumentRef() {
    return _collectionReference.doc();
  }

  @override
  Future<Post?> getData({required String id}) async {
    final docs = await _collectionReference.doc(id).get();
    try {
      return Post.fromDocument(docs);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> insert({required Post post}) async {
    await post.postRef!.set(post.toJson());
  }

  @override
  Future<void> update({required Post post}) async {
    await post.postRef!.update(post.toJson());
  }

  @override
  Future<void> delete({required String id}) async {
    await _collectionReference.doc(id).delete();
  }

  @override
  Stream<List<DocumentSnapshot<Object?>>> getSearchPost(
      {required Position position}) {
    geo = GeoFlutterFire();
    GeoFirePoint currentLocation =
        geo.point(latitude: position.latitude, longitude: position.longitude);
    double radius = 1; //1km
    return geo
        .collection(collectionRef: _collectionReference)
        .within(center: currentLocation, radius: radius, field: 'postPosition');
  }

  @override
  Future<void> deleteAll({required List<String> ids}) async {
    for (var id in ids) {
      await delete(id: id);
    }
  }

  @override
  Future<List<Post>> getMyLike({required List<MyLike> myLikes}) async {
    final List<Post> list = [];
    for (var myLike in myLikes) {
      final docs = await myLike.postRef!.get();
      final post = Post.fromDocument(docs);
      list.add(post);
    }
    return list;
  }
}
