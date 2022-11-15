import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:life_snap/common/print_log.dart';
import 'package:life_snap/infrastructure/provider/firebase_providers.dart';

final imageReferenceProvider =
    Provider.family.autoDispose<Reference, bool>((ref, isCamera) {
  printLog(value: "imageReferenceProvider init");
  ref.onDispose(() => printLog(value: "imageReferenceProvider dispose"));
  String folderName = (isCamera) ? "postImage" : "userImage";
  final reference = ref.read(fireStorageProvider).ref(folderName);
  return reference;
});
