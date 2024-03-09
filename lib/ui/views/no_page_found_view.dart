import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('404 - No page found', style: GoogleFonts.montserratAlternates(),),
     ),
   );
  }
}