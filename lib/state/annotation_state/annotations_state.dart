import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_snap/state/annotation_state/annotation.dart';

import '../../domain/entity/post/post.dart';

part 'annotations_state.freezed.dart';

@freezed
class AnnotationsState with _$AnnotationsState {
  const factory AnnotationsState({@Default([]) List<Annotation> annotations}) =
      _AnnotationsState;
}
