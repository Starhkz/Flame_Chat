import 'package:flame_chat/shared/app_strings.dart';
import 'package:flame_chat/shared/cards.dart';
import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(
            height: 51,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black,
                        ),
                      ),
                      Center(
                        child: Text(
                          AppString.userName,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 29,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 275,
                  height: 40,
                  child: TextField(
                    style: const TextStyle(fontSize: 20, color: Colors.grey),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: AppColors.darkBack,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      suffixIcon: const SVGLoader(svgPath: AppString.svgSearch),
                    ),
                  ),
                ),
                const SVGLoader(svgPath: AppString.svgAdd)
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Row(
              children: [
                Text(
                  'Chatrooms',
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  var wids = List.filled(
                      5,
                      ProfileCard(
                        profile: UserProfile(index),
                        hasPhoto: false,
                      ));
                  return wids[index];
                }),
                prototypeItem: null,
                itemCount: 5,
              )),
          const SizedBox(
            height: 31,
          ),
          const SVGLoader(svgPath: AppString.svgScroll),
          const SizedBox(
            height: 31,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  var wids = List.filled(
                    8,
                    RecentChat(
                      profile: UserProfile(index),
                      isGroup: false,
                    ),
                  );
                  return wids[index];
                }),
                itemCount: 8,
              ),
            ),
          ),
          Row(
            children: const [],
          )
        ],
      ),
    );
  }
}
