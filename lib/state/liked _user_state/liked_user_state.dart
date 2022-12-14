import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/liked_user/liked_user.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/auth_provider.dart';
import 'package:life_snap/infrastructure/repository/like_repository.dart';

import '../../common/print_log.dart';

part 'liked_user_state.freezed.dart';

@freezed
class LikedUserState with _$LikedUserState {
  const factory LikedUserState({bool? isFavolit}) = _LikedUserState;
}

final likedUserStateNotifierProvider =
    StateNotifierProvider.autoDispose<LikedUserStateNotifier, LikedUserState>(
        (ref) {
  printLog(value: 'likedUserStateNotifierProvider init');
  ref.onDispose(
      () => printLog(value: 'likedUserStateNotifierProvider dispose'));
  return LikedUserStateNotifier(
    user: ref.read(userProvider),
    likeRepository: ref.read(likeRepositoryProvider),
  );
});

class LikedUserStateNotifier extends StateNotifier<LikedUserState> {
  LikedUserStateNotifier(
      {required User? user, required LikeRepository likeRepository})
      : _likeRepository = likeRepository,
        super(const LikedUserState());

  final LikeRepository _likeRepository;

  Future<void> isLikes({required String uid, required Post post}) async {
    final String id = post.id;

    final isFavolit = await _likeRepository.isLikes(id: id, uid: uid);
    state = state.copyWith(isFavolit: isFavolit);
  }

  Future<void> setLike({required String uid, required Post post}) async {
    final String id = post.id;
    final newLike = LikedUser(id: uid, createdAt: DateTime.now());
    await _likeRepository.insert(
      like: newLike,
      id: id,
      uid: uid,
    );
    state = state.copyWith(isFavolit: true);
  }

  Future<void> deleteLike({required uid, required Post post}) async {
    await _likeRepository.delete(
      uid: uid,
      id: post.id,
    );
    state = state.copyWith(isFavolit: false);
  }

  Future<void> deleteAll({
    required String id,
  }) async {
    final List<String> uids = await _likeRepository.getIds(id: id);
    if (uids == []) {
      return;
    }
    await _likeRepository.deleteAll(id: id, uids: uids);
  }
}
