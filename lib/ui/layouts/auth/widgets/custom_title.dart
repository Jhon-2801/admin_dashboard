import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'twitter-white-logo.png',
          width: 50,
          height: 50,
          ),
    
          const SizedBox( height: 20,),
    
          FittedBox(
            fit: BoxFit.cover,
            child: Text('Happening Now', style: GoogleFonts.montserratAlternates(
              fontSize: 50,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          )
      ],
    );
  }
}
