import 'package:flame_chat/shared/cards.dart';
import 'package:flame_chat/shared/models/profile.dart';
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
