import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';
import 'package:life_snap/infrastructure/repository/my_post_repository.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';

final checkPostPageNotifierProvider =
    StateNotifierProvider.autoDispose<CheckPostPageNotifier, Post>((ref) {
  printLog(value: 'checkPostPageNotifierProvider init');
  ref.onDispose(() => printLog(value: 'checkPostPageNotifierProvider dispose'));
  return CheckPostPageNotifier(
      postRepository: ref.read(postRepositoryProvider),
      imageRepository: ref.read(imageRepositoryProvider),
      myPostRepository: ref.read(myPostRepositoryProvider));
});

class CheckPostPageNotifier extends StateNotifier<Post> {
  CheckPostPageNotifier(
      {required PostRepository postRepository,
      required ImageRepository imageRepository,
      required MyPostRepository myPostRepository})
      : _postRepository = postRepository,
        _imageRepository = imageRepository,
        _myPostRepository = myPostRepository,
        super(Post.initial());

  final PostRepository _postRepository;
  final ImageRepository _imageRepository;
  final MyPostRepository _myPostRepository;

  Future<void> setPost(Post post) async {
    state = post;
  }

  Future<void> increment(Post post) async {
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
    state = newPost;
  }

  Future<void> decrement(Post post) async {
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
    state = newPost;
  }

  Future<void> deletePost(Post post) async {
    const folderName = "postFolder";
    await _myPostRepository.delete(uid: post.postUserRef!.id, id: post.id);
    await _imageRepository.deleteImage(folderName: folderName, id: post.id);
    await _postRepository.delete(id: post.id);
  }
}
