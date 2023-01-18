import 'package:flame_chat/shared/app_strings.dart';
import 'package:flame_chat/shared/enums/chat_enums.dart';
import 'package:flame_chat/shared/widgets.dart';
import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
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
              const SizedBox(
                height: 52,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    Text(
                      'Favourites',
                      style:
                          GoogleFonts.roboto(fontSize: 20, color: Colors.white),
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
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ProfileCard(
                            profile: UserProfile(index),
                            hasPhoto: true,
                          ),
                        ),
                      );
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
                        ),
                      );
                      return wids[index];
                    }),
                    itemCount: 8,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 275 + 60,
              child: TextBoxAnim(
                  hintText: 'Search...',
                  screenWidth: screenWidth,
                  type: TextBoxType.search),
            ),
          ),
        ],
      ),
    );
  }
}
