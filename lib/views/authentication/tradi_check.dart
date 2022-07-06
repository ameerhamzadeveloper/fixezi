import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/views/authentication/join_fixezi.dart';
import 'package:fixezi/views/authentication/user_signup/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/colors.dart';
class TrediesCheckPage extends StatefulWidget {
  const TrediesCheckPage({Key? key}) : super(key: key);

  @override
  _TrediesCheckPageState createState() => _TrediesCheckPageState();
}

class _TrediesCheckPageState extends State<TrediesCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: BackButton(color: Colors.white,),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: const Alignment(0.0,-0.0),
                child: Image.asset(AssetsConfig.tradieVector,height: 200,width: 170,fit: BoxFit.fill,)),
              Align(
                alignment: const Alignment(0.0,-0.5),
                child: SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      Text("Are you a tradie?",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                      const SizedBox(height: 30,),
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
                  Text("Only registered trade businesses can signup",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Colors.red,
                    onPressed: (){
                      nextScreen(context, UserSignUp());
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
                      nextScreen(context, JoinFixeziPage());
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
