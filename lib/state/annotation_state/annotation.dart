import 'package:life_snap/domain/entity/post/post.dart';
import 'package:ar_location_view/ar_annotation.dart';

class Annotation extends ArAnnotation {
  Post post;
  Annotation({required super.uid, required super.position, required this.post});
}
