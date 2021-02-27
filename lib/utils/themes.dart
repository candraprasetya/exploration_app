part of 'utils.dart';

mixin colors {
  static final Color primaryBlue = Vx.hexToColor('#5960EC');
  static final Color accentPink = Vx.hexToColor('#FF54B0');
  static final Color textGrey = Vx.hexToColor('#CCCCCC');
  static final Color semanticWhite = Vx.hexToColor('#FFFFFF');
  static final Color semanticGreen = Vx.hexToColor('#33B805');
  static final Color semanticPink = Vx.hexToColor('#FF54B0');
  static final Color semanticGrey = Vx.hexToColor('#F3F4F8');
  static final Color semanticBlack = Vx.hexToColor('#2A334A');
  static final Color semanticPurple = Vx.hexToColor('#9554FF');
  static final Color semanticBlue = Vx.hexToColor('#43BBFF');
}

mixin tStyle {
  static final TextStyle headline6 = GoogleFonts.quicksand(
    fontSize: 20,
    letterSpacing: 0.15,
    fontWeight: FontWeight.bold,
    color: colors.semanticWhite,
  );
  static final TextStyle button = GoogleFonts.quicksand(
    fontSize: 14,
    letterSpacing: 1.25,
    fontWeight: FontWeight.w500,
    color: colors.semanticWhite,
  );
  static final TextStyle subtitle1 = GoogleFonts.quicksand(
    fontSize: 14,
    letterSpacing: 0.15,
    fontWeight: FontWeight.bold,
    color: colors.semanticBlack,
  );
  static final TextStyle subtitle2 = GoogleFonts.quicksand(
    fontSize: 12,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: colors.semanticBlack,
  );
  static final TextStyle bottomNavText = GoogleFonts.quicksand(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle caption = GoogleFonts.quicksand(
    fontSize: 8,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w500,
    color: colors.semanticWhite,
  );
  static final TextStyle general = GoogleFonts.quicksand(
    fontSize: 10,
    color: colors.semanticWhite,
  );
}
