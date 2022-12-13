import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/like/like.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/auth_provider.dart';
import 'package:life_snap/infrastructure/repository/like_repository.dart';

import '../../common/print_log.dart';

part 'like_state.freezed.dart';

@freezed
class LikeState with _$LikeState {
  const factory LikeState({bool? isFavolit}) = _LikeState;
}

final likeStateNotifierProvider =
    StateNotifierProvider.autoDispose<LikeStateNotifier, LikeState>((ref) {
  printLog(value: 'likeStateNotifierProvider init');
  ref.onDispose(() => printLog(value: 'likeStateNotifierProvider dispose'));
  return LikeStateNotifier(
    user: ref.read(userProvider),
    likeRepository: ref.read(likeRepositoryProvider),
  );
});

class LikeStateNotifier extends StateNotifier<LikeState> {
  LikeStateNotifier(
      {required User? user, required LikeRepository likeRepository})
      : _likeRepository = likeRepository,
        super(const LikeState());

  final LikeRepository _likeRepository;

  Future<void> isLikes({required String uid, required Post post}) async {
    final String id = post.id;

    final isFavolit = await _likeRepository.isLikes(id: id, uid: uid);
    state = state.copyWith(isFavolit: isFavolit);
  }

  Future<void> setLike({required String uid, required Post post}) async {
    final String id = post.id;
    final newLike = Like(id: uid, createdAt: DateTime.now());
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
