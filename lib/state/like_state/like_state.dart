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
      : _user = user,
        _likeRepository = likeRepository,
        super(const LikeState());

  final User? _user;
  final LikeRepository _likeRepository;

  Future<void> isLikes({required Post post}) async {
    if (_user == null) return;
    final String uid = _user!.uid;
    final String id = post.id;

    final isFavolit = await _likeRepository.isLikes(uid: uid, id: id);
    state = state.copyWith(isFavolit: isFavolit);
  }

  Future<void> setLike({required Post post}) async {
    if (_user == null) return;
    final String id = post.id;
    final String uid = _user!.uid;

    final newLike = Like(id: id, createdAt: DateTime.now());
    await _likeRepository.insert(
      uid: uid,
      like: newLike,
    );
    state = state.copyWith(isFavolit: true);
  }

  Future<void> deleteLike({required Post post}) async {
    if (_user == null) return;
    final String uid = _user!.uid;

    await _likeRepository.delete(id: post.id, uid: uid);
    state = state.copyWith(isFavolit: false);
  }

  Future<void> deleteAll() async {
    if (_user == null) return;
    final String uid = _user!.uid;

    final List<String> ids = await _likeRepository.getIds(uid: uid);
    if (ids == []) {
      return;
    }
    await _likeRepository.deleteAll(ids: ids, uid: uid);
  }
}
