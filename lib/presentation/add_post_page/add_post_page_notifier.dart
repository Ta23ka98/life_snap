// import 'dart:io';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final AddPostPageNotifierProvider =
// StateNotifierProvider<AddPostPageNotifier, Post>((ref) {
//   return AddPostPageNotifier(
//     postRepository: ref.read(postRepositoyProvider),
//   );
// });
//
// class AddPostPageNotifier extends StateNotifier<Post> {
//   AddPostNotifier({
//     required PostRepository postRepository,
//   })  : _postRepository = postRepository,
//         super(Post.initial());
//
//   final PostRepository _postRepository;
//
// //投稿ボタン押下時
// Future<void> onPost({required String title, required String content ,required File image}) async {
//   // 登録処理
// }
// }