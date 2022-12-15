import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/liked_user/liked_user.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/app_user_repository.dart';
import 'package:life_snap/infrastructure/repository/liked_user_repository.dart';
import 'package:life_snap/infrastructure/repository/my_like_repository.dart';

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
    likedUserRepository: ref.read(likedUserRepositoryProvider),
    appUserRepository: ref.read(appUserRepositoryProvider),
    myLikeRepository: ref.read(myLikeRepositoryProvider),
  );
});

class LikeStateNotifier extends StateNotifier<LikeState> {
  LikeStateNotifier(
      {required LikedUserRepository likedUserRepository,
      required AppUserRepository appUserRepository,
      required MyLikeRepository myLikeRepository})
      : _likedUserRepository = likedUserRepository,
        _appUserRepository = appUserRepository,
        _myLikeRepository = myLikeRepository,
        super(const LikeState());

  final LikedUserRepository _likedUserRepository;
  final AppUserRepository _appUserRepository;
  final MyLikeRepository _myLikeRepository;

  Future<void> isLikes({required String uid, required Post post}) async {
    final String id = post.id;

    final isFavolit = await _likedUserRepository.isLikes(id: id, uid: uid);
    state = state.copyWith(isFavolit: isFavolit);
  }

  Future<void> setLike({required String uid, required Post post}) async {
    final postUserRef = _appUserRepository.getDocumentRef(uid: uid);
    final String id = post.id;
    final newLikedUser =
        LikedUser(id: uid, postUserRef: postUserRef, createdAt: DateTime.now());
    await _likedUserRepository.insert(
      id: id,
      likedUser: newLikedUser,
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
    final List<LikedUser> likedUsers =
        await _likedUserRepository.getLikedUser(id: id);
    if (likedUsers == []) {
      return;
    }
    await _myLikeRepository.deleteAll(id: id, likedUsers: likedUsers);
    await _likedUserRepository.deleteAll(id: id, likedUsers: likedUsers);
  }
}
