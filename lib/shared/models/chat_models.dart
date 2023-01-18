import 'package:flame_chat/shared/models/profile.dart';

import 'date_model.dart';

class Message {
  final String text;
  final Date date;
  final UserProfile profile;
  final bool isPhoto;
  final bool isUser;
  final String? imageUrl;

  const Message(this.text, this.date, this.profile, this.isPhoto, this.imageUrl,
      this.isUser);
}
