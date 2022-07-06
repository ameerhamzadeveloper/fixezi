import 'dart:io';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/views/splash.dart';
import 'package:fixezi/views/user/previous_history.dart';
import 'package:fixezi/views/user/settings.dart';
import 'package:fixezi/views/user/your_invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../config/assets_config.dart';
import '../../provider/signup_provider.dart';
import '../components/rating_component.dart';
class YourInfoUser extends StatefulWidget {
  @override
  _YourInfoUserState createState() => _YourInfoUserState();
}

class _YourInfoUserState extends State<YourInfoUser> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    // final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            // SizedBox(height: 40,),
            Container(
              width: double.infinity,
              color: greyBgColor,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
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
              leading: Icon(LineIcons.user),
              title: Text("Your Info",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserYourInvoice()),
              leading: Icon(LineIcons.fileInvoice),
              title: Text("Your Invoice",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserPreviousHistory()),
              leading: Icon(LineIcons.history),
              title: Text("Previous History",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Share.share("This is Fixezi");
              },
              leading: Icon(LineIcons.share),
              title: Text("Share",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, USerSettings()),
              leading: Icon(LineIcons.cog),
              title: Text("Settings",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Are you sure to logout?"),
                    actions: [
                      TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
                      TextButton(onPressed: (){
                        pro.clearSharedData();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                      }, child: Text("Logout",style: TextStyle(color: Colors.red),)),
                    ],
                  );
                });
              },
              leading: Icon(LineIcons.alternateSignOut),
              title: Text("Logout",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: Container(),
        title: Text("Your Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: pro.userProfileImage == '' ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: aquaColor,width: 5)
                      ),
                      child: Center(child: Text(pro.userProfileData['username'].toString().substring(0,1).toUpperCase(),style: GoogleFonts.poppins(fontSize:50,fontWeight: FontWeight.bold,color: Colors.white),),),
                    ): Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 5),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(File(pro.userProfileImage))
                        )
                      ),
                    ),
                  ),
                  // TextButton(onPressed: (){
                  //   showDialog(context: context, builder: (ctx){
                  //     return AlertDialog(
                  //       content: Container(
                  //         height: 80,
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             InkWell(
                  //               onTap:(){
                  //                 pro.pickImageProfileUser(1,context);
                  //                 Navigator.pop(context);
                  //               },
                  //               child: Center(
                  //                 child: Text("Camera"),
                  //               ),
                  //             ),
                  //             SizedBox(height: 10,),
                  //             Divider(),
                  //             SizedBox(height: 10,),
                  //             InkWell(
                  //               onTap:(){
                  //                 pro.pickImageProfileUser(2,context);
                  //                 Navigator.pop(context);
                  //               },
                  //               child: Center(
                  //                 child: Text("Gallery"),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   });
                  // }, child: Text("Edit Profile"))
                ],
              ),
              // TextButton(onPressed: (){
              //   Future.delayed(Duration(seconds: 2),(){
              //     FlutterLocalNotificationsPlugin().show(2, "Fixezi", "You Have Recieved New Job Request", NotificationDetails(iOS: IOSNotificationDetails(presentAlert: true,presentBadge: true,presentSound: true,)));
              //   });
              // }, child: Text("Send Notification")),
              SizedBox(height: 50,),
              Text("Personal Information",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.user,size: 30,color: Colors.white),
                          SizedBox(width: 10,),
                          Text(pro.userProfileData['username'] ?? "Loading...",style: GoogleFonts.poppins(color: Colors.white),)
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(LineIcons.phone,size: 30,color: Colors.white,),
                          const SizedBox(width: 10,),
                          Text(pro.userProfileData['mobileNumber'] ?? "Loading...",style: GoogleFonts.poppins(color: Colors.white),)
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(LineIcons.envelope,size: 30,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text(pro.userProfileData['email'] ?? "Loading...",style: GoogleFonts.poppins(color: Colors.white),)
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(LineIcons.mapMarker,size: 30,color: Colors.white),
                          const SizedBox(width: 10,),
                          Text(pro.userProfileData['address'] ?? "Loading...",style: GoogleFonts.poppins(color: Colors.white),)
                        ],
                      ),
                    ),
                    // Divider(color: Colors.black,),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("Your Ratings",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 10,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Easily Contacted",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: 1),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Easy to work for",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: 4),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment on Completion",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: 2),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jobs Completed/Cancelled",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  Text("2/3",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quotes Accepted/Cancelled",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  Text("1/3",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
