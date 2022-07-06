import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/views/authentication/trade_signup/tradi_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TradeSignUpNote2 extends StatefulWidget {
  const TradeSignUpNote2({Key? key}) : super(key: key);

  @override
  _TradeSignUpNote2State createState() => _TradeSignUpNote2State();
}

class _TradeSignUpNote2State extends State<TradeSignUpNote2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tradie",style: GoogleFonts.poppins(color: blueColor),),
            const Text(" Signup"),
            SizedBox(width: getWidth(context) / 6,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Spacer(),
            Text(" Just a few things to help you out :",style:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 20,),
            Text("Once registered all information and images you upload can be edited in the ‘Company profile’ screen in the Admin dashboard.",style: GoogleFonts.poppins(color: Colors.white),),
            SizedBox(height: 20,),
            Text("The client will have the ability to rate your company and refer you to others, likewise you can rate them.",style: GoogleFonts.poppins(color: Colors.white),),
            SizedBox(height: 20,),
            Text("Job reaction is crucial to success, you must answer jobs as quickly as possible, if you dont the client may use someone else.",style: GoogleFonts.poppins(color: Colors.white),),
            SizedBox(height: 20,),
            Text("All credit card payments will be made with ‘Stripe’ we do not store your details.",style: GoogleFonts.poppins(color: Colors.white),),
            SizedBox(height: 20,),
            Spacer(),
            Center(child: Image.asset(AssetsConfig.plansvector,width: 300,height: 50,fit: BoxFit.fill,)),
            SizedBox(height: 20,),
            Spacer(),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: blueColor,
              onPressed: (){
                nextScreen(context, TradiSignUp());
              },
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 30,),
                  Text("SignUp",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Icon(Icons.arrow_forward,color: Colors.white,)
                ],
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
