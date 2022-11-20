import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';

final postRepositoryProvider = Provider.autoDispose<PostRepository>((ref) =>
    PostRepository(
        collectionReference: ref.read(postCollectionReferenceProvider)));

abstract class BasePostRepository {
  DocumentReference getDocumentRef();
  Future<Post?> getData(String id);
  Future<void> insert(Post post);
  Future<void> update(Post post);
  Future<void> delete(Post post);
}

class PostRepository implements BasePostRepository {
  PostRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  DocumentReference getDocumentRef() {
    return _collectionReference.doc();
  }

  @override
  Future<Post?> getData(String id) async {
    final docs = await _collectionReference.doc(id).get();
    try {
      return Post.fromDocument(docs);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> insert(Post post) async {
    await post.postRef!.set(post.toJson());
  }

  @override
  Future<void> update(Post post) async {
    await post.postRef!.update(post.toJson());
  }

  @override
  Future<void> delete(Post post) async {
    await post.postRef!.delete();
  }
}
