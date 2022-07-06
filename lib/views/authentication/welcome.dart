import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/views/authentication/login/login_check.dart';
import 'package:fixezi/views/authentication/quick_search/quick_search.dart';
import 'package:fixezi/views/authentication/tradi_check.dart';
import 'package:fixezi/views/drawer/our_story.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

import '../employee/employe_bottom.dart';
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: btnLightBlueColor,
                        //     spreadRadius: 2,
                        //     blurRadius: 6,
                        //     offset: Offset(0, 4),
                        //   ),
                        // ],
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsConfig.logo)
                        )
                    ),
                  ),
                  Text("Fixezi",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("The App Of All Trades",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            ListTile(
              onTap: ()=>Navigator.pop(context),
              leading: Icon(LineIcons.home),
              title: Text("Home",style: GoogleFonts.poppins(),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              onTap: ()=>nextScreen(context, OurStory()),
              leading: Icon(LineIcons.book),
              title: Text("Our Story",style: GoogleFonts.poppins(),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(LineIcons.newspaper),
              title: Text("Website",style: GoogleFonts.poppins(),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(LineIcons.facebookF),
              title: Text("Fixezi Facebook",style: GoogleFonts.poppins(),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ListTile(
              leading: Icon(LineIcons.phone),
              title: Text("Contact Info",style: GoogleFonts.poppins(),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // InkWell(
              //   onTap: ()=>_scaffoldKey.currentState!.openDrawer(),
              //   child: Image.asset(AssetsConfig.drawerIcon,height: 20,)),
              Icon(Icons.account_balance,color: greyBgColor,size: 20,),
              getLogoText(),
              getBottomPart(),
            ],
          ),
        ),
      ),
    );
  }

  getLogoText(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity,height: 40,),
        Text(" Hire trades at the \nspeed of thought",style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
        SizedBox(height: 60,),
        Image.asset(AssetsConfig.loginVector,height: getHeight(context) / 4,),
        SizedBox(height: 10,),
        Text("With Qualified Local Trades all in one place!\n Fixezi The App of All Trades\n Is the most intuitive way to book your next trades person.",textAlign: TextAlign.center,style: GoogleFonts.poppins(color: Colors.white),),
        // Text("Fixezi",style: GoogleFonts.balooDa2(fontSize: 42,fontWeight: FontWeight.bold,color: Colors.black),),
        // SizedBox(height: 20,),
        // Text("New user or Tradesman? Please sign up",style: GoogleFonts.akshar(fontSize: 22,color: Colors.black),textAlign: TextAlign.center,),
      ],
    );
  }
  getBottomPart(){
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("New user or tradie?\nPlease Sign up",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
        SizedBox(height: 40,),
        MaterialButton(
          height: 50,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: aquaColor,
          onPressed: (){
            nextScreen(context, const TrediesCheckPage());
          },
          child:  Text("Create an account",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 10,),
        MaterialButton(
          height: 50,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: Colors.white,
          onPressed: (){
            nextScreen(context, const LoginCheck());
          },
          child:  Text("Login",style: GoogleFonts.poppins(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 10,),
        MaterialButton(
          height: 50,
          minWidth: double.infinity,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          color: btnBlueColor,
          onPressed: (){
            nextScreen(context, const QuickSearch(isFromBottom: false,));
          },
          child:  Text("Quick Search",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
