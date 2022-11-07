import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/print_log.dart';

part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState({
    File? imageFile,
  }) = _ImageState;
}

final imageStateNotifierProvider =
StateNotifierProvider.autoDispose<ImageStateNotifier, ImageState>((ref) {
  printLog(value: 'imageStateNotifierProvider init');
  ref.onDispose(() => printLog(value:'imageStateNotifierProvider dispose'));
  return ImageStateNotifier();
});

class ImageStateNotifier extends StateNotifier<ImageState> {
  ImageStateNotifier() :super(const ImageState());

  Future<bool>imagePermissionCheck()async{
    // permission_handler: permissionを拒否した場合,再度permissionをリクエストさせる処理
    return true;
  }

  Future<XFile?> getImage({required bool isCamera}) async {
    ImageSource type = (isCamera) ? ImageSource.camera : ImageSource.gallery;
    final image = await ImagePicker()
        .pickImage(source: type);
    return image;
  }

  Future<ImageState> setImage(XFile? image) async {
    if (image == null) return state = state.copyWith(imageFile: null);
    return state = state.copyWith(imageFile: File(image.path));
  }

  void clearImage() {
    state = state.copyWith(imageFile: null);
  }
}
