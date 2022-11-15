import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/image_providers.dart';

import '../../domain/entity/post.dart';

final imageRepositoryProvider =
    Provider.autoDispose<ImageRepository>((ref) => ImageRepository(ref));

abstract class BaseImageRepository {
  Future<String> uploadImage(
      {required bool isCamera, required String uid, File? image});
  Future<void> deleteImage({required bool isCamera, required Post post});
}

class ImageRepository implements BaseImageRepository {
  ImageRepository(this._ref);
  final ProviderRef _ref;

  @override
  Future<String> uploadImage(
      {required bool isCamera, required String uid, File? image}) async {
    final reference = _ref.read(imageReferenceProvider(isCamera));
    await reference.child(uid).putFile(image!);
    String downloadUrl = await reference.child(uid).getDownloadURL();
    return downloadUrl;
  }

  @override
  Future<void> deleteImage({required bool isCamera, required Post post}) async {
    final reference = _ref.read(imageReferenceProvider(isCamera));
    await reference.child(post.postReference!.id).delete();
  }
}
