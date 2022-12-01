import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
  return LikeStateNotifier();
});

class LikeStateNotifier extends StateNotifier<LikeState> {
  LikeStateNotifier() : super(const LikeState());
}
