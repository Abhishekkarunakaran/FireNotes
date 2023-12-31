// ignore_for_file: prefer_const_constructors

import '../shared/dependencies.dart';

class CT {
  static Color black = const Color(0xFF080808);
  static Color primary = const Color(0xFF59BAAB);
  static Color noteCard = const Color(0xFF2A2A2A);
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

  static TextStyle noteCardStyle = GoogleFonts.montserrat(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);

  static TextStyle noteCardTitle = GoogleFonts.montserrat(
    fontSize: 15, fontWeight:FontWeight.w500, color: Colors.white
  );

  static TextStyle titleHint = GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF666666));

  static TextStyle contentHint = GoogleFonts.montserrat(
      fontSize: 15, fontWeight: FontWeight.normal, color: Color(0xFF666666));

  static TextStyle titleStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle contentStyle = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static TextStyle noNotes = GoogleFonts.montserrat(
      fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF666666));
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
