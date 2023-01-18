import 'package:flame_chat/screens/chat_room.dart';
import 'package:flame_chat/screens/favorites_screen.dart';
import 'package:flame_chat/screens/home.dart';
import 'package:flutter/cupertino.dart';

class SwitchScreens extends StatefulWidget {
  const SwitchScreens({super.key});

  @override
  State<SwitchScreens> createState() => _SwitchScreensState();
}

class _SwitchScreensState extends State<SwitchScreens> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        ChatRoom(),
        HomePage(),
        FavoritePage(),
        ChatRoomMenu(),
      ],
    );
  }
}
