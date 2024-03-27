import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    super.key, 
    required this.onPressed, 
    required this.text, 
    required this.icon,
    this.isFilled = false, 
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(   
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        backgroundColor: MaterialStatePropertyAll(const Color(0xff092044).withOpacity(0.9)),
        overlayColor: MaterialStatePropertyAll(const Color(0xff092044).withOpacity(0.3)),
      ),
      onPressed: () => onPressed(),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text, style: const TextStyle(color: Colors.white),),
          const SizedBox(width: 10,),
          Icon(icon, color: Colors.white,),
        ],
      ),

    );
  }
}
