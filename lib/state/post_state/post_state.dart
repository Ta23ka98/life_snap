import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/domain/entity/post/post.dart';

part 'post_state.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({Post? post, @Default([]) List<Post> posts}) =
      _PostState;
}
