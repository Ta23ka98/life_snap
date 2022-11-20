import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/infrastructure/provider/post_providers.dart';
import 'package:life_snap/state/annotation_state/annotation.dart';
import 'package:life_snap/state/annotation_state/annotations_state.dart';

final arScreenPageNotifierProvider =
    StateNotifierProvider.autoDispose<ArScreenPageNotifier, AnnotationsState>(
        (ref) {
  printLog(value: 'arScreenPageNotifierProvider init');
  ref.onDispose(() => printLog(value: 'arScreenPageNotifierProvider dispose'));
  return ArScreenPageNotifier(
      collectionReference: ref.read(postCollectionReferenceProvider));
});

class ArScreenPageNotifier extends StateNotifier<AnnotationsState> {
  ArScreenPageNotifier({required CollectionReference collectionReference})
      : _collectionReference = collectionReference,
        super(const AnnotationsState());

  final CollectionReference _collectionReference;
  late GeoFlutterFire geo;

// 範囲内の投稿を取得
  Stream<List<DocumentSnapshot>> getSearchPost(Position position) {
    geo = GeoFlutterFire();
    GeoFirePoint currentLocation =
        geo.point(latitude: position.latitude, longitude: position.longitude);
    double radius = 1; //1km
    return geo
        .collection(collectionRef: _collectionReference)
        .within(center: currentLocation, radius: radius, field: 'postPosition');
  }

// 取得した情報をAnnotationsに追加
  Future<void> getAnnotations(Position position) async {
    final stream = getSearchPost(position);
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
