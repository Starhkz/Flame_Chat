import 'package:flame_chat/shared/app_strings.dart';

String manPath(int num, {bool isJPG = true}) {
  num %= 5;
  num += 1;
  if (num == 5) isJPG = false;
  String ext = isJPG ? 'jpg' : 'png';
  String path = '${AppString.baseAssetString}man_$num.$ext';
  return path;
}

String womanPath(int num) {
  num %= 7;
  num += 1;
  String path = '${AppString.baseAssetString}woman_$num.jpg';
  return path;
}

String person(int num) {
  num += 1;
  double dub = num.toDouble();

  if (num.isOdd) {
    dub += 1;
    dub /= 2;
    return manPath(dub.toInt());
  } else {
    return womanPath(dub.toInt());
  }
}
