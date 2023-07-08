import '../shared/dependencies.dart';

class CT {
  static Color black = const Color(0xFF080808);
  static Color primary = const Color(0xFF59BAAB);
}

class TT {
  static TextStyle textFieldTitle = GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  static TextStyle whiteButtonText = GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.w600, color: CT.primary);
  static TextStyle swipeText = GoogleFonts.montserrat(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: CT.primary.withOpacity(.75));
  static TextStyle textFieldStyle = GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white);
}

class WT {
  static Widget logo = Text(
    'Notes',
    style: GoogleFonts.kronaOne(fontSize: 55, color: Colors.white),
  );

  static Widget appBarLogo = Text(
    'Notes',
    style: GoogleFonts.kronaOne(fontSize: 25, color: Colors.white),
  );
}
