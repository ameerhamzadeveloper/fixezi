import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/assets_config.dart';
import '../../config/colors.dart';
import '../../constants.dart';
class FixeziLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: getWidth(context) / 2.5,
          color: redColor,
        ),
        Text("Fixezi",style: GoogleFonts.akshar(fontSize: 52,fontWeight: FontWeight.bold,color: Colors.black),),
        Container(
          height: 4,
          width: getWidth(context) / 2.5,
          color: redColor,
        ),
        SizedBox(height: 10,),
        Text("The App Of All Trades",style: GoogleFonts.poppins(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600),),
        SizedBox(height: 30,),
        Image.asset(AssetsConfig.logo,height: 200,)
      ],
    );
  }
}
