import 'dart:math';

import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/styling/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_strings.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;
  final bool hasPhoto;

  const ProfileCard({Key? key, required this.profile, this.hasPhoto = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> names = profile.name.split(' ');
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 10,
      child: Container(
        width: 95,
        height: 140,
        decoration: BoxDecoration(
          image: hasPhoto
              ? DecorationImage(
                  image: AssetImage(profile.imagePath), fit: BoxFit.fill)
              : null,
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 3, 170, 241),
              Color.fromARGB(255, 79, 88, 168),
              Color.fromARGB(255, 160, 2, 89)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
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
      ),
    );
  }
}

class RecentChat extends StatelessWidget {
  final UserProfile profile;
  final bool isGroup;
  const RecentChat({
    Key? key,
    required this.profile,
    this.isGroup = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          ProfllePhoto(
            isGroup: isGroup,
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
    return isGroup
        ? SizedBox(
            width: 54,
            height: 44,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: ProfileImage(
                    imagePath: imagePath,
                    radius: 17,
                  ),
                ),
                const Align(
                    alignment: Alignment.topLeft, child: Indicator(num: 5)),
              ],
            ),
          )
        : ProfileImage(imagePath: imagePath, radius: 22);
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.imagePath,
    required this.radius,
  }) : super(key: key);

  final String imagePath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      backgroundImage: AssetImage(imagePath),
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

class Button extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final bool hasBorder;
  final double borderWidth;
  final Color borderColor;
  const Button(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.color = AppColors.grey,
      this.hasBorder = false,
      this.borderColor = const Color(0xFF000000),
      this.borderWidth = 1,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: hasBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: child),
    );
  }
}

class AccessCard extends StatelessWidget {
  const AccessCard({
    Key? key,
    required this.profile,
  }) : super(key: key);
  final UserProfile profile;
  @override
  Widget build(BuildContext context) {
    bool hasAdmin = (profile.index % 3 == 0);
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 9, 0, 18),
      child: SizedBox(
        height: 99,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfllePhoto(isGroup: false, imagePath: profile.imagePath),
                  Text(
                    profile.name,
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  color: hasAdmin ? AppColors.lilac : AppColors.grey,
                  width: 120,
                  child: Text(
                    'Full Access',
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
                Button(
                  color: hasAdmin ? AppColors.grey : AppColors.lightGrey,
                  width: 140,
                  child: Text(
                    'Regular Access',
                    style:
                        GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                ),
                const Button(
                  color: AppColors.grey,
                  borderColor: AppColors.orange,
                  hasBorder: true,
                  child: SVGLoader(svgPath: AppString.svgDelete),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
