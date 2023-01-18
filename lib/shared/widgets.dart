import 'dart:math';

import 'package:flame_chat/shared/enums/chat_enums.dart';
import 'package:flame_chat/shared/models/chat_models.dart';
import 'package:flame_chat/shared/models/profile.dart';
import 'package:flame_chat/shared/tools.dart';
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
      backgroundImage: imagePath != '' ? AssetImage(imagePath) : null,
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

class ChatBox extends StatelessWidget {
  const ChatBox(
      {super.key,
      required this.message,
      required this.screenWidth,
      required this.type,
      required this.text});
  final double screenWidth;
  final Message? message;
  final MessageType type;
  final String? text;

  const ChatBox.message(
      {super.key,
      required this.screenWidth,
      required this.message,
      this.type = MessageType.text,
      this.text});
  const ChatBox.joined(
      {super.key,
      this.type = MessageType.joined,
      required this.screenWidth,
      this.message,
      this.text});

  @override
  Widget build(BuildContext context) {
    double maxWidth = screenWidth * .7;
    switch (type) {
      case MessageType.image:
        return SizedBox(
          width: 203,
          height: 97,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  width: 24,
                  height: 24,
                  child: SVGLoader(svgPath: AppString.svgCancel)),
              const SizedBox(
                  width: 24,
                  height: 24,
                  child: SVGLoader(svgPath: AppString.svgDownload)),
              Container(
                height: 97,
                width: 130,
                decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(message!.imageUrl ?? ''))),
              ),
            ],
          ),
        );
      case MessageType.text:
        return Stack(children: [
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: message!.isUser ? AppColors.darkBack : AppColors.grey),
              constraints: BoxConstraints(minHeight: 40, maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    message!.text,
                    style: GoogleFonts.roboto(
                        color: Colors.white60,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          !message!.isUser
              ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: const Offset(12, 0),
                    child: ProfileImage(
                        imagePath: message!.imageUrl ?? '', radius: 12),
                  ),
                )
              : const SizedBox.shrink()
        ]);
      case MessageType.joined:
        return Text(
          text!,
          style: GoogleFonts.abel(
              fontSize: 16,
              color: Colors.white54,
              fontWeight: FontWeight.normal),
        );
      default:
        return Stack(children: [
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: message!.isUser ? AppColors.darkBack : AppColors.grey),
              constraints: BoxConstraints(minHeight: 40, maxWidth: maxWidth),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    message!.text,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ),
          !message!.isUser
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: ProfileImage(
                      imagePath: message!.imageUrl ?? '', radius: 12),
                )
              : const SizedBox.shrink()
        ]);
    }
  }
}

// class TextBox extends StatefulWidget {
//   const TextBox({
//     Key? key,
//     required this.hintText,
//     required this.width,
//     required this.type,
//   }) : super(key: key);
//   final String hintText;

//   final double width;

//   final TextBoxType type;

//   @override
//   State<TextBox> createState() => _TextBoxState();
// }

// class _TextBoxState extends State<TextBox> {
//   @override
//   Widget build(BuildContext context) {
//     switch (widget.type) {
//       case TextBoxType.search:
//         return TextBoxAnim(
//           hintText: widget.hintText,
//           screenWidth: widget.width,
//           type: widget.type,
//         );
//       case TextBoxType.chat:
//         return TextBoxAnim(
//           hintText: widget.hintText,
//           screenWidth: widget.width,
//         );
//       default:
//         return TextBoxAnim(
//           hintText: widget.hintText,
//           screenWidth: widget.width,
//         );
//     }
//   }
// }

class TextArea extends StatefulWidget {
  const TextArea({
    Key? key,
    required this.hintText,
    required this.clicked,
  }) : super(key: key);
  final String hintText;
  final void Function() clicked;

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 275,
      constraints: const BoxConstraints(minHeight: 40),
      child: TextField(
        onTap: () => setState(() {
          widget.clicked();
        }),
        maxLines: 6,
        minLines: 1,
        style: const TextStyle(fontSize: 20, color: Colors.grey),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.roboto(
              fontSize: 14, color: Colors.white60, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: AppColors.darkBack,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class TextBoxAnim extends StatefulWidget {
  const TextBoxAnim(
      {super.key,
      required this.hintText,
      required this.screenWidth,
      required this.type});
  final String hintText;
  final double screenWidth;
  final TextBoxType type;
  @override
  State<TextBoxAnim> createState() => _TextBoxAnimState();
}

class _TextBoxAnimState extends State<TextBoxAnim>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  bool goForward = true;
  late Animation<double> animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double icon1dx, icon2dx, icon1dy, icon2dy;
          double icon1X, icon2X, icon1Y, icon2Y;
          icon2dy = animation.value * 60;
          icon1dx = animation.value * 60;
          icon2dx = 0;
          icon1dy = 0;
          icon1X = (275 - 40) + icon1dx;
          icon2X = (275 + 20) + icon2dx;
          icon1Y = 0 + icon1dy;
          icon2Y = 0 + icon2dy;
          return SizedBox(
            height: double.infinity,
            width: 400,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: (widget.type == TextBoxType.chat) ? 10 : null,
                  top: (widget.type == TextBoxType.search) ? 110 : null,
                  child: TextArea(
                    hintText: widget.hintText,
                    clicked: () {
                      goForward ? _controller.forward() : _controller.reverse();
                      setState(() {
                        goForward = !goForward;
                      });
                    },
                  ),
                ),
                Positioned(
                    left: icon1X,
                    bottom: (widget.type == TextBoxType.chat) ? 10 : null,
                    top: (widget.type == TextBoxType.search) ? 110 : null,
                    child: GestureDetector(
                      onTap: () {
                        goForward
                            ? _controller.forward()
                            : _controller.reverse();
                        setState(() {
                          goForward = !goForward;
                        });
                      },
                      child: SVGLoader(
                        svgPath: (widget.type == TextBoxType.chat)
                            ? (goForward
                                ? AppString.svgChatInactive
                                : AppString.svgChatActive)
                            : AppString.svgSearch,
                      ),
                    )),
                Positioned(
                  bottom: (widget.type == TextBoxType.chat) ? 10 : null,
                  top: (widget.type == TextBoxType.search) ? 110 : null,
                  child: Transform.translate(
                      offset: Offset(icon2X, -icon2Y),
                      child: GestureDetector(
                        onTap: () {
                          goForward
                              ? _controller.forward()
                              : _controller.reverse();
                          setState(() {
                            goForward = !goForward;
                          });
                        },
                        child: Button(
                          color: AppColors.lightGreen,
                          child: SVGLoader(
                            svgPath: (widget.type == TextBoxType.search)
                                ? AppString.svgAdd
                                : AppString.svgCamera,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        });
  }
}
