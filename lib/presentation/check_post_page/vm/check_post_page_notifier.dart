import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/my_like/my_like.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';
import 'package:life_snap/infrastructure/repository/my_like_repository.dart';
import 'package:life_snap/infrastructure/repository/my_post_repository.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';
import 'package:life_snap/state/post_state/post_state.dart';

final checkPostPageNotifierProvider =
    StateNotifierProvider.autoDispose<CheckPostPageNotifier, PostState>((ref) {
  printLog(value: 'checkPostPageNotifierProvider init');
  ref.onDispose(() => printLog(value: 'checkPostPageNotifierProvider dispose'));
  return CheckPostPageNotifier(
    postRepository: ref.read(postRepositoryProvider),
    imageRepository: ref.read(imageRepositoryProvider),
    myPostRepository: ref.read(myPostRepositoryProvider),
    myLikeRepository: ref.read(myLikeRepositoryProvider),
  );
});

class CheckPostPageNotifier extends StateNotifier<PostState> {
  CheckPostPageNotifier(
      {required PostRepository postRepository,
      required ImageRepository imageRepository,
      required MyPostRepository myPostRepository,
      required MyLikeRepository myLikeRepository})
      : _postRepository = postRepository,
        _imageRepository = imageRepository,
        _myPostRepository = myPostRepository,
        _myLikeRepository = myLikeRepository,
        super(const PostState());

  final PostRepository _postRepository;
  final ImageRepository _imageRepository;
  final MyPostRepository _myPostRepository;
  final MyLikeRepository _myLikeRepository;

  Future<void> setPost({required Post post}) async {
    state = state.copyWith(post: post);
  }

  Future<void> increment({required String uid, required Post post}) async {
    final newPost = Post(
        id: post.id,
        postUserRef: post.postUserRef,
        postRef: post.postRef,
        title: post.title,
        content: post.content,
        postImageURL: post.postImageURL,
        likeCount: post.likeCount!.toInt() + 1,
        postPosition: post.postPosition,
        createdAt: post.createdAt);
    await _postRepository.update(post: newPost);
    final myLike = MyLike(
        id: newPost.id, postRef: newPost.postRef, createdAt: DateTime.now());
    await _myLikeRepository.insert(uid: uid, myLike: myLike);
    state = state.copyWith(post: newPost);
  }

  Future<void> decrement({required String uid, required Post post}) async {
    final newPost = Post(
        id: post.id,
        postUserRef: post.postUserRef,
        postRef: post.postRef,
        title: post.title,
        content: post.content,
        postImageURL: post.postImageURL,
        likeCount: post.likeCount!.toInt() - 1,
        postPosition: post.postPosition,
        createdAt: post.createdAt);
    await _postRepository.update(post: newPost);
    await _myLikeRepository.delete(uid: uid, id: newPost.id);
    state = state.copyWith(post: newPost);
  }

  Future<void> deletePost({required String uid, required Post post}) async {
    const folderName = "postFolder";
    // myPostの削除
    await _myPostRepository.delete(uid: uid, id: post.id);
    // myLikeの削除
    await _myLikeRepository.delete(uid: uid, id: post.id);
    // imageの削除
    await _imageRepository.deleteImage(folderName: folderName, id: post.id);
    // postの削除
    await _postRepository.delete(id: post.id);
  }

  Future<void> getMyLikePost({required String uid}) async {
    final list = await _myLikeRepository.getMyLikes(uid: uid);
    final postList = await _postRepository.getMyLike(myLikes: list);
    state = state.copyWith(posts: postList);
  }
}
