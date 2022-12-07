import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/domain/entity/post/post.dart';
import 'package:life_snap/domain/entity/post/post_position.dart';
import 'package:life_snap/infrastructure/repository/post_repository.dart';

void main() {
  late FirebaseFirestore fireStore;
  late GeoFlutterFire geo;
  late DocumentReference postRef;
  late DocumentReference userRef;
  late PostRepository repo;

  setUp(() async {
    fireStore = FakeFirebaseFirestore();
    final ref = fireStore.collection("posts");
    final container = ProviderContainer(
      overrides: [
        postRepositoryProvider
            .overrideWithValue(PostRepository(collectionReference: ref)),
      ],
    );

    repo = await container.read(postRepositoryProvider);
    geo = GeoFlutterFire();
    userRef = await fireStore.collection('users').add({
      'username': 'Taro Yamada',
    });
    postRef = repo.getDocumentRef();
  });

  group('CRUD', () {
    test('新規投稿を保存し、キーで読込する', () async {
      var post = makePostData(postRef, userRef);
      await repo.insert(post: post);
      final postCompare = await repo.getData(id: post.id);
      expect(post.title, postCompare!.title);
    });
    test('投稿を更新し、キーで読込する', () async {
      var post = makePostData(postRef, userRef);
      await repo.insert(post: post);
      post = post.copyWith(title: 'titleUpd');
      await repo.update(post: post);
      final postCompare = await repo.getData(id: post.id);
      expect(post.title, postCompare!.title);
    });
    test('投稿を削除し、キーで読込する（エラー）', () async {
      var post = makePostData(postRef, userRef);
      await repo.insert(post: post);
      await repo.delete(id: post.id);
      final postCompare = await repo.getData(
        id: post.id,
      );
      expect(postCompare, null);
    });
  });
  group('Geo', () {
    test('東京駅1Km内で検索', () async {
      // 現在地（東京駅）
      GeoFirePoint currentLocation =
          geo.point(latitude: 35.68117517675323, longitude: 139.76597681220616);

      // 5km圏内
      double radius = 1;

      // 地点登録
      await repo.insert(
        post: makePostDataAddGeo(
            postRef,
            userRef,
            'フォーシンズホテル東京',
            geo.point(
                latitude: 35.67819467060889, longitude: 139.76696386500694)),
      );
      await repo.insert(
          post: makePostDataAddGeo(
              postRef,
              userRef,
              'Apple丸の内',
              geo.point(
                  latitude: 35.68005096380495, longitude: 139.76364865494213)));
      await repo.insert(
          post: makePostDataAddGeo(
              postRef,
              userRef,
              '虎ノ門ヒルズ（圏外）',
              geo.point(
                  latitude: 35.66794520317008, longitude: 139.75018415175742)));

      var postsReference = fireStore.collection('posts');

      Stream<List<DocumentSnapshot>> stream = geo
          .collection(collectionRef: postsReference)
          .within(
              center: currentLocation, radius: radius, field: 'postPosition');

      stream.listen((List<DocumentSnapshot> documentList) {
        Iterable<Post>? postList =
            documentList.map((doc) => Post.fromDocument(doc));
        // 圏内のものが吐き出される
        print(postList);
        // if (postList.isEmpty) {
        //   expect(postList.length, 2);
        // } else {
        //   expect(1, 2);
        // }
      });
    });
  });
}

Post makePostData(DocumentReference postRef, DocumentReference userRef) {
  return Post(
    id: postRef.id,
    postRef: postRef,
    postImageURL: r"/path/image",
    title: "titleInsert",
    content: "content",
    likeCount: 6,
    postUserRef: userRef,
    createdAt: DateTime.now(),
    postPosition: const PostPosition(
        geoHash: 'tdr1wz2vh', geoPoint: GeoPoint(12.960632, 77.641603)),
  );
}

Post makePostDataAddGeo(DocumentReference postRef, DocumentReference userRef,
    String title, GeoFirePoint geoFirePoint) {
  return Post(
      id: postRef.id,
      postRef: postRef,
      postImageURL: r"/path/image",
      title: title,
      content: "content",
      likeCount: 6,
      postUserRef: userRef,
      createdAt: DateTime.now(),
      postPosition: PostPosition.fromGeoFirePoint(geoFirePoint));
}
