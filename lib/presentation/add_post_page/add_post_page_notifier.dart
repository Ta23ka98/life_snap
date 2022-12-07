import 'dart:io';

import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/my_post/my_post.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/domain/entity/post/post_position.dart';
import 'package:life_snap/infrastructure/repository/app_user_repository.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';
import 'package:life_snap/infrastructure/repository/my_post_repository.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';

final addPostPageNotifierProvider =
    StateNotifierProvider<AddPostPageNotifier, Post>((ref) {
  return AddPostPageNotifier(
      appUserRepository: ref.read(appUserRepositoryProvider),
      postRepository: ref.read(postRepositoryProvider),
      imageRepository: ref.read(imageRepositoryProvider),
      myPostRepository: ref.read(myPostRepositoryProvider));
});

class AddPostPageNotifier extends StateNotifier<Post> {
  AddPostPageNotifier({
    required PostRepository postRepository,
    required AppUserRepository appUserRepository,
    required ImageRepository imageRepository,
    required MyPostRepository myPostRepository,
  })  : _appUserRepository = appUserRepository,
        _postRepository = postRepository,
        _imageRepository = imageRepository,
        _myPostRepository = myPostRepository,
        super(Post.initial());
  final AppUserRepository _appUserRepository;
  final PostRepository _postRepository;
  final ImageRepository _imageRepository;
  final MyPostRepository _myPostRepository;
  final GeoFlutterFire geo = GeoFlutterFire();

//投稿ボタン押下時
  Future<void> addPost(
      {required String uid,
      required String title,
      required String content,
      required Position position,
      required File image}) async {
    // final String uid = "user1"; //仮の値

    // DocumentReference
    final postUserRef = _appUserRepository.getDocumentRef(uid: uid);

    // DocumentReference
    final postRef = _postRepository.getDocumentRef();

    // 画像の保存、URLの取得
    final postImageUrl = await _imageRepository.uploadImage(
        id: postRef.id, folderName: "postFolder", image: image);
    final geoFirePoint =
        geo.point(latitude: position.latitude, longitude: position.longitude);

    // geoFirePointの変換
    final postPosition = PostPosition.fromGeoFirePoint(geoFirePoint);

    // 投稿内容を格納
    final newPost = Post(
        id: postRef.id,
        postUserRef: postUserRef,
        postRef: postRef,
        title: title,
        content: content,
        postImageURL: postImageUrl,
        postPosition: postPosition,
        createdAt: DateTime.now());

    // 投稿処理
    await _postRepository.insert(post: newPost);

    // 投稿IDを格納
    final myPost = MyPost(id: newPost.id, createdAt: DateTime.now());

    // サブコレクション(myPosts)にIdを登録
    _myPostRepository.insert(
        uid: newPost.postUserRef!.id, id: myPost.id!, myPost: myPost);
  }
}
