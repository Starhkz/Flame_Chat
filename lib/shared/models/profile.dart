import 'package:flame_chat/shared/app_strings.dart';
import 'package:flame_chat/shared/tools.dart';

class UserProfile {
  final int index;
  const UserProfile(this.index);

  String get name {
    int len = nameList.length;
    int num = index % len;

    return nameList[num];
  }

  String get imagePath {
    return person(index);
  }

  bool get isFavorite {
    return (index % 3 == 0);
  }
}
