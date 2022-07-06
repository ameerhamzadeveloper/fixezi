import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/views/authentication/trade_signup/trade_sign_up_note2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TradeSignupNote1 extends StatefulWidget {
  const TradeSignupNote1({Key? key}) : super(key: key);

  @override
  _TradeSignupNote1State createState() => _TradeSignupNote1State();
}

class _TradeSignupNote1State extends State<TradeSignupNote1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tradie",style: GoogleFonts.poppins(color: blueColor),),
            Text(" Signup"),
            SizedBox(width: getWidth(context) / 6,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text("Join our growing list of trades to receive\n legitimate jobs from\n clients in your servicing locations. ",style:GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Image.asset(AssetsConfig.tradiesignUpNoteVector),
            SizedBox(height: 20,),
            Spacer(),
            Text("  When you recieve a job, it’s up to you if you accept it, otherwise it doesn’t cost a cent to stay listed on FIxezi-The App of All Trades.",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold),),
            // Spacer(),
            SizedBox(height: 80,),
            SizedBox(
              // width: 200,
              child: MaterialButton(
                height: 50,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                color: blueColor,
                onPressed: (){
                  nextScreen(context, TradeSignUpNote2());
                },
                child: Text("Continue",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
