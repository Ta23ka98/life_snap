import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/my_like/my_like.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/my_like_repository.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';
import 'package:life_snap/state/post_state/post_state.dart';

final userLikePageNotifierProvider =
    StateNotifierProvider.autoDispose<UserLikePageNotifier, PostState>((ref) {
  printLog(value: 'userLikePageNotifierProvider init');
  ref.onDispose(() => printLog(value: 'userLikePageNotifierProvider dispose'));
  return UserLikePageNotifier(
    postRepository: ref.read(postRepositoryProvider),
    myLikeRepository: ref.read(myLikeRepositoryProvider),
  );
});

class UserLikePageNotifier extends StateNotifier<PostState> {
  UserLikePageNotifier(
      {required PostRepository postRepository,
      required MyLikeRepository myLikeRepository})
      : _postRepository = postRepository,
        _myLikeRepository = myLikeRepository,
        super(const PostState());

  final PostRepository _postRepository;
  final MyLikeRepository _myLikeRepository;

  void setPost({required Post post}) {
    state = state.copyWith(post: post);
  }

  Future<void> getData({required String id}) async {
    final post = await _postRepository.getData(id: id);
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

  Future<void> getMyLikePost({required String uid}) async {
    final list = await _myLikeRepository.getMyLikes(uid: uid);
    final postList = await _postRepository.getMyLike(myLikes: list);
    state = state.copyWith(posts: postList);
  }
}
