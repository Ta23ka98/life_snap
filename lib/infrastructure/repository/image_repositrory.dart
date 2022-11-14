import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/infrastructure/provider/image_providers.dart';

final imageRepositoryProvider =
    Provider.autoDispose<ImageRepository>((ref) => ImageRepository(ref));

abstract class BaseImageRepository {
  Future<String> uploadImage(
      {required bool isCamera, required String uid, File? image});
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
}
