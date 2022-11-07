import 'package:flutter/foundation.dart';

void printLog({required dynamic value}) {
  if(kDebugMode) {
    print(value.toString());
  }
}