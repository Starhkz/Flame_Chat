import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppString {
  static const baseAssetString = 'assets/svg_icons/';
  static const userName = 'Prince Emelife';
  static const moreMessages =
      "So, I'm doing great, thank you. Have some bula bla";
  static const svgAdd = '${baseAssetString}add_svg.svg';
  static const svgSearch = '${baseAssetString}search_svg.svg';
  static const svgScroll = '${baseAssetString}scroll_svg.svg';
  static const svgDelete = '${baseAssetString}delete_svg.svg';
  static const svgDownload = '${baseAssetString}download_svg.svg';
  static const svgCancel = '${baseAssetString}cancel_svg.svg';
  static const svgChatActive = '${baseAssetString}chat_active_svg.svg';
  static const svgChatInactive = '${baseAssetString}chat_inactive_svg.svg';
  static const svgCamera = '${baseAssetString}camera_svg.svg';

  static const pngMan = '${baseAssetString}man_5.png';

  static const cJan = 'January';
  static const cFeb = 'February';
  static const cMar = 'March';
  static const cApr = 'April';
  static const cMay = 'May';
  static const cJun = 'June';
  static const cJul = 'July';
  static const cAug = 'August';
  static const cSep = 'September';
  static const cOct = 'October';
  static const cNov = 'November';
  static const cDec = 'December';
}

class SVGLoader extends StatelessWidget {
  final String svgPath;

  const SVGLoader({super.key, required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svgPath);
  }
}

const nameList = [
  'Mike Ben',
  'James Bond',
  'T-Rex Ment',
  'Mad Monkey',
  'Finished Goat',
  'Greta Good',
  'Yur Papae',
  'Chief Priest',
];
