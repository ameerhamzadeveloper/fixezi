import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FixeziButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onTap;

  const FixeziButton({Key? key,required this.title,required this.color, required this.onTap,required this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 47,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      color: color,
      onPressed: onTap,
      child:  Text(title,style: GoogleFonts.poppins(color: textColor,fontSize: 20,fontWeight: FontWeight.bold),),
    );
  }
}
