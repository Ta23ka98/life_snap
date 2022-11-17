import 'dart:io';

import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/domain/entity/post/post_position.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';

final addPostPageNotifierProvider =
    StateNotifierProvider<AddPostPageNotifier, Post>((ref) {
  return AddPostPageNotifier(
    postRepository: ref.read(postRepositoryProvider),
    imageRepository: ref.read(imageRepositoryProvider),
  );
});

class AddPostPageNotifier extends StateNotifier<Post> {
  AddPostPageNotifier(
      {required PostRepository postRepository,
      required ImageRepository imageRepository})
      : _postRepository = postRepository,
        _imageRepository = imageRepository,
        super(Post.initial());

  final PostRepository _postRepository;
  final ImageRepository _imageRepository;
  final GeoFlutterFire geo = GeoFlutterFire();

//投稿ボタン押下時
  Future<void> addPost(
      {required String title,
      required String content,
      required Position position,
      required File image}) async {
    // DocumentReference
    final postRef = _postRepository.getDocumentRef();

    // 画像の保存、URLの取得
    final postImageUrl = await _imageRepository.uploadImage(
        id: postRef.id, folderName: "postFolder", image: image);
    final geoFirePoint =
        geo.point(latitude: position.latitude, longitude: position.longitude);

    // geoFirePointの変換
    final postPosition = PostPosition.fromGeoFirePoint(geoFirePoint);

    final newPost = Post(
        id: postRef.id,
        postRef: postRef,
        title: title,
        content: content,
        postImageURL: postImageUrl,
        postPosition: postPosition,
        createdAt: DateTime.now());

    await _postRepository.insert(newPost);
  }
}
