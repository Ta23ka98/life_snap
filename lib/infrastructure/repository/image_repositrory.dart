import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final imageRepositoryProvider = Provider.autoDispose<ImageRepository>(
    (ref) => ImageRepository(firebaseStorage: ref.read(fireStorageProvider)));

abstract class BaseImageRepository {
  Future<String> uploadImage(
      {required String id, required String folderName, File? image});

  Future<void> deleteImage({required String folderName, required String id});
}

class ImageRepository implements BaseImageRepository {
  ImageRepository({required FirebaseStorage firebaseStorage})
      : _firebaseStorage = firebaseStorage;

  final FirebaseStorage _firebaseStorage;

  @override
  Future<String> uploadImage(
      {required String id, required String folderName, File? image}) async {
    final reference = _firebaseStorage.ref(folderName);
    await reference.child(id).putFile(image!);
    String downloadUrl = await reference.child(id).getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> deleteImage(
      {required String folderName, required String id}) async {
    final reference = _firebaseStorage.ref(folderName);
    await reference.child(id).delete();
  }
}
