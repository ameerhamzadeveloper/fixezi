import 'package:fixezi/views/authentication/trade_signup/trade_sign_up_1.dart';
import 'package:fixezi/views/authentication/user_signup/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/assets_config.dart';
import '../../config/colors.dart';
import '../../constants.dart';
class JoinFixeziPage extends StatefulWidget {
  const JoinFixeziPage({Key? key}) : super(key: key);
  @override
  _JoinFixeziPageState createState() => _JoinFixeziPageState();
}

class _JoinFixeziPageState extends State<JoinFixeziPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                  alignment: const Alignment(0.0,-0.0),
                  child: Image.asset(AssetsConfig.tradieVector,height: 180,)),
              Align(
                alignment: Alignment(0.0,-0.5),
                child: SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      Text("Do you want to join\nFixezi as a tradie?",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),

                      // Container(
                      //   height: 4,
                      //   width: getWidth(context) / 2.5,
                      //   color: redColor,
                      // ),
                      // Text("Fixezi",style: GoogleFonts.akshar(fontSize: 42,fontWeight: FontWeight.bold,color: Colors.black),),
                      // Container(
                      //   height: 4,
                      //   width: getWidth(context) / 2.5,
                      //   color: redColor,
                      // ),
                      // SizedBox(height: 10,),
                      // Text("The App Of All Trades",style: GoogleFonts.poppins(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 30,),
                  // Text("Do you want to join Fixezi as a tradie?",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                  const SizedBox(height: 30,),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.red,
                    onPressed: (){
                      nextScreen(context, const UserSignUp());
                    },
                    child:  Text("No",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 10,),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: aquaColor,
                    onPressed: (){
                      nextScreen(context, TradeSignupNote1());
                    },
                    child:  Text("Yes",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
