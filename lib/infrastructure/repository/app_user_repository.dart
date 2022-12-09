import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/app_user_providers.dart';

final appUserRepositoryProvider =
    Provider.autoDispose<AppUserRepository>((ref) {
  return AppUserRepository(
      collectionReference: ref.read(userCollectionReferenceProvider));
});

abstract class BaseAppUserRepository {
  DocumentReference getDocumentRef({required String uid});
}

class AppUserRepository implements BaseAppUserRepository {
  AppUserRepository({required CollectionReference collectionReference})
      : _collectionReference = collectionReference;

  final CollectionReference _collectionReference;

  @override
  DocumentReference getDocumentRef({required String uid}) {
    return _collectionReference.doc(uid);
  }
}
