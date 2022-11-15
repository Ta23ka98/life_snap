import 'dart:io';

import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/post.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';

final postRepositoryProvider =
    Provider.autoDispose<PostRepository>((ref) => PostRepository(ref));

abstract class BasePostRepository {
  Future<void> addPost({
    required bool isCamera,
    required String title,
    required String content,
    required String postImageURL,
    required GeoFirePoint point,
    required File imageFile,
  });
  Future<void> deletePost({required Post post});
}

class PostRepository implements BasePostRepository {
  PostRepository(this._ref);

  final ProviderRef _ref;
  late final _docRef = _ref.read(postsReferenceWithConverterProvider);
  late final _imageRepository = _ref.read(imageRepositoryProvider);
  final _postUserId = ""; //firebaseAuthからuid取得
  @override
  Future<void> addPost(
      {required bool isCamera,
      required String title,
      required String content,
      required String postImageURL,
      required GeoFirePoint point,
      required File imageFile}) async {

    final _postReference = _docRef.doc();
    final _imageUrl = await _imageRepository.uploadImage(
        uid: _postReference.id, image: imageFile, isCamera: isCamera);

    final newPost = Post(
      postUserId: _postUserId,
      title: title,
      content: content,
      postImageURL: _imageUrl,
      postReference: _postReference,
      point: point.geoPoint,
      geoHash: point.hash,
    );
    await newPost.postReference!.set(newPost);
  }

  @override
  Future<void> deletePost({required Post post}) async {
    await post.postReference!.delete();
  }
}
