import 'package:flutter/material.dart'
    show
        Brightness,
        BuildContext,
        Color,
        Colors,
        ColorScheme,
        MaterialColor,
        ThemeData;
import 'package:string_analyzer/theme/_import.dart'
    show circularProgressIndicatorColorValue;

ThemeData light({
  required BuildContext context,
}) =>
    ThemeData.light(
      useMaterial3: false,
    ).copyWith(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          const Color(
            // Sepia, the ink that was used for writing and drawing (on parchment among others)
            0xFF704214, // WebAIM: white background, this foreground
            // ignore: deprecated_member_use
          ).value,
          // https://m2.material.io/design/color/the-color-system.html#tools-for-picking-colors
          // Lion (DECC9C), gives a palette that matches the picture of a loosely rolled parchment scroll (https://commons.wikimedia.org/wiki/File:%D7%A7%D7%9C%D7%A3,_%D7%A0%D7%95%D7%A6%D7%94_%D7%95%D7%93%D7%99%D7%95.jpg)
          const {
            50: Color(
              0xFFF1EBD7,
            ),
            100: Color(
              0xFFDECC9C,
            ),
            200: Color(
              0xFFC8AC5B,
            ),
            300: Color(
              0xFFB38C08,
            ),
            400: Color(
              0xFFA67800,
            ),
            500: Color(
              0xFF9B6300,
            ),
            600: Color(
              0xFF9B5A00,
            ),
            700: Color(
              0xFF984D00,
            ),
            800: Color(
              0xFF933E00,
            ),
            900: Color(
              0xFF8B2300,
            ),
          },
        ),
        accentColor: const Color(
          circularProgressIndicatorColorValue, // WebAIM: FAFAFA background, this foreground, Contrast Ratio 3 (Graphical Objects and User Interface Components)
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        cardColor: Colors.white,
        errorColor: const Color(
          // French violet; can't be red due to the accent and contrast is good
          0xFF8806CE,
        ),
      ),
    );
