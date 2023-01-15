import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/repository/image_repositrory.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';
import 'package:life_snap/state/annotation_state/annotation.dart';
import 'package:life_snap/state/annotation_state/annotations_state.dart';

final arScreenPageNotifierProvider =
    StateNotifierProvider.autoDispose<ArScreenPageNotifier, AnnotationsState>(
        (ref) {
  printLog(value: 'arScreenPageNotifierProvider init');
  ref.onDispose(() => printLog(value: 'arScreenPageNotifierProvider dispose'));

  return ArScreenPageNotifier(
    postRepository: ref.read(postRepositoryProvider),
    imageRepository: ref.read(imageRepositoryProvider),
  );
});

class ArScreenPageNotifier extends StateNotifier<AnnotationsState> {
  ArScreenPageNotifier(
      {required PostRepository postRepository,
      required ImageRepository imageRepository})
      : _postRepository = postRepository,
        super(const AnnotationsState());
  final PostRepository _postRepository;

// 取得した情報をAnnotationsに追加
  Future<void> getAnnotations(Position position) async {
    final stream = _postRepository.getSearchPost(position: position);
    stream.listen((List<DocumentSnapshot> documentList) {
      final annotationList = documentList.map((docs) {
        final post = Post.fromDocument(docs);
        final latitude = post.postPosition!.geoPoint.latitude;
        final longitude = post.postPosition!.geoPoint.longitude;
        final position = Position(
            longitude: longitude,
            latitude: latitude,
            timestamp: null,
            accuracy: 0,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 0);
        return Annotation(uid: post.id, position: position, post: post);
      }).toList();
      state = state.copyWith(annotations: annotationList);
    });
  }
}
