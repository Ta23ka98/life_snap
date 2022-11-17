import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

class Functions {
  static Future<Position?> getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final request = await Geolocator.requestPermission();
      if (request == LocationPermission.denied) {
        return null;
      } else {
        return await Geolocator.getCurrentPosition();
      }
    } else {
      return await Geolocator.getCurrentPosition();
    }
  }
}
