import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/liked_user/liked_user.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/liked_user_repository.dart';

import '../../common/print_log.dart';

part 'like_state.freezed.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState({bool? isFavolit}) = _LikeState;
}

final likeStateNotifierProvider =
    StateNotifierProvider.autoDispose<LikedUserStateNotifier, LikeState>((ref) {
  printLog(value: 'likeStateNotifierProvider init');
  ref.onDispose(() => printLog(value: 'likeStateNotifierProvider dispose'));
  return LikedUserStateNotifier(
    likedUserRepository: ref.read(likedUserRepositoryProvider),
  );
});

class LikedUserStateNotifier extends StateNotifier<LikeState> {
  LikedUserStateNotifier({required LikedUserRepository likedUserRepository})
      : _likedUserRepository = likedUserRepository,
        super(const LikeState());

  final LikedUserRepository _likedUserRepository;

  Future<void> isLikes({required String uid, required Post post}) async {
    final String id = post.id;

    final isFavolit = await _likedUserRepository.isLikes(id: id, uid: uid);
    state = state.copyWith(isFavolit: isFavolit);
  }

  Future<void> setLike({required String uid, required Post post}) async {
    final String id = post.id;
    final newLikedUser = LikedUser(id: uid, createdAt: DateTime.now());
    await _likedUserRepository.insert(
      likedUser: newLikedUser,
      id: id,
      uid: uid,
    );
    state = state.copyWith(isFavolit: true);
  }

  Future<void> deleteLike({required uid, required Post post}) async {
    await _likedUserRepository.delete(
      uid: uid,
      id: post.id,
    );
    state = state.copyWith(isFavolit: false);
  }

  Future<void> deleteAll({
    required String id,
  }) async {
    final List<String> uids = await _likedUserRepository.getIds(id: id);
    if (uids == []) {
      return;
    }
    await _likedUserRepository.deleteAll(id: id, uids: uids);
  }
}
