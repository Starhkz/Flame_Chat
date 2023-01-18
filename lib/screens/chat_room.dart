import 'package:flame_chat/shared/app_strings.dart';
import 'package:flame_chat/shared/widgets.dart';
import 'package:flame_chat/shared/enums/chat_enums.dart';
import 'package:flame_chat/shared/models/chat_models.dart';
import 'package:flame_chat/shared/models/date_model.dart';
import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/shared/tools.dart';
import 'package:flame_chat/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatRoomMenu extends StatefulWidget {
  const ChatRoomMenu({super.key});

  @override
  State<ChatRoomMenu> createState() => _ChatRoomMenuState();
}

class _ChatRoomMenuState extends State<ChatRoomMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 62, 0, 0),
            child: Text(
              'Chatroom',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: SizedBox(
              width: 325,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'New User',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    width: 185,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Delete Chatroom',
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Team',
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var cards = List.filled(
                    8,
                    AccessCard(profile: UserProfile(index)),
                  );
                  return cards[index];
                },
                itemCount: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth * .8;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 51,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ProfileHeader(
                  width: width,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '16 Jan 13:16',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
              const MessageListView(),
            ],
          ),
          Center(
            child: SizedBox(
              width: 275 + 60,
              child: TextBoxAnim(
                  hintText: 'Write',
                  screenWidth: screenWidth,
                  type: TextBoxType.chat),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final double width;
  ProfileHeader({super.key, required this.width});

  final List<Widget> wids = List.generate(
      7,
      (index) => Align(
          alignment:
              index.isEven ? Alignment.topCenter : Alignment.bottomCenter,
          child: ProfllePhoto(isGroup: false, imagePath: person(index))));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      // decoration: BoxDecoration(color: AppColors.orange),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: wids),
    );
  }
}

class MessageListView extends StatefulWidget {
  const MessageListView({super.key});

  @override
  State<MessageListView> createState() => _MessageListViewState();
}

class _MessageListViewState extends State<MessageListView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
        child: SizedBox(
      width: width * .85,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: messages[index].isUser
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: ChatBox(
                message: messages[index],
                screenWidth: width,
                type: (index % 4 == 0) ? MessageType.image : MessageType.text,
                text: '',
              ),
            ),
          );
        },
        itemCount: 10,
      ),
    ));
  }
}

List<Message> messages = List.generate(
    10,
    (index) => Message(AppString.moreMessages, Date.toDate(DateTime.now()),
        UserProfile(index), (index % 4 == 0), person(index), (index.isEven)));
