import 'dart:math';

import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_strings.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileCard({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = profile.name.split(' ');
    return Container(
      width: 95,
      height: 140,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(profile.imagePath), fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(3, 169, 241, 100),
            Color.fromRGBO(79, 88, 168, 100),
            Color.fromRGBO(160, 2, 90, 100)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5.0,
            spreadRadius: 4.0,
            offset: Offset(2.0, 3.0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.translate(
              offset: const Offset(0, 15),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      names[0],
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      names[1],
                      style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class RecentChat extends StatelessWidget {
  final UserProfile profile;
  const RecentChat({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ProfllePhoto(
            isGroup: true,
            imagePath: profile.imagePath,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 186,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.name,
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        AppString.moreMessages,
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '2:15',
                    style:
                        GoogleFonts.roboto(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfllePhoto extends StatelessWidget {
  final bool isGroup;
  final String imagePath;
  const ProfllePhoto({
    Key? key,
    required this.isGroup,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54,
      height: 44,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 17,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
          const Align(alignment: Alignment.topLeft, child: Indicator(num: 5)),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int num;
  const Indicator({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    int val = min(num, 9);
    String display = '+ $val';
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          color: AppColors.lightBack, borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        display,
        style: GoogleFonts.roboto(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
      )),
    );
  }
}
