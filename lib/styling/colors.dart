
import 'package:flutter/material.dart';

class AppColors {
  //uncategorized
 static const background = Color.fromRGBO(41, 47, 63, 100);

 static const darkBack = Color.fromRGBO(17, 19, 26, 100);
  //grey
  static const greys = MaterialColor(
    0xffDCDCDC, //same as grey100 from the design guide
    {
      300: Color(0xff8A8A8A),
      400: Color(0xff6D6D6D),
      500: Color(0xff434343),
      600: Color(0xff353535),
      700: Color(0xff282828),
      800: Color(0xff101010),
    },
  );
}