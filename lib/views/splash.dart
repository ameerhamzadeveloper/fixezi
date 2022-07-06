import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/welcome.dart';
import 'package:fixezi/views/employee/employe_bottom.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:fixezi/views/user/user_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  bool isOkay = false;
  bool isOkay1 = false;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('logo');

    final IOSInitializationSettings initializationSettingsIOS =
    IOSInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      // onDidReceiveLocalNotification: (){},
    );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
        macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }
  void selectNotification(String? payload) async {
    //Handle notification tapped logic here
  }
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<SignupProvider>(context,listen: false);
    pro.getSharedData();
    pro.setHeader();
    init();
    Future.delayed(const Duration(seconds: 3),(){
      if(pro.userId != ''){
        if(pro.userType == 1){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserBottom()));
        }else if(pro.userType == 2){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TradieBottom()));
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmployeeBottom()));
        }
      }else{
        nextReplacementScreen(context, const WelcomePage());
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              child: getBody()
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody(){
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                height: 4,
                width: getWidth(context) / 2.5,
                color: redColor,
              ),
              Text("Fixezi",style: GoogleFonts.akshar(fontSize: 60,fontWeight: FontWeight.bold,color: Colors.black),),
              Container(
                height: 4,
                width: getWidth(context) / 2.5,
                color: redColor,
              ),
              SizedBox(height: 10,),
              Text("The App of All Trades",style: GoogleFonts.akshar(fontSize: 30,color: Colors.black),),
              SizedBox(height: 10,),
              SizedBox(height: 100,),
              Container(
                height: 140,
                width: 140,
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     image: const DecorationImage(
                //         fit: BoxFit.fill,
                //         image: AssetImage(AssetsConfig.logo)
                //     )
                // ),
              ),
              const Spacer(),
              Text("100% Certified tradie's",style: GoogleFonts.karla(fontSize: 27,color: Colors.black.withOpacity(0.6),fontWeight: FontWeight.bold),),
              SizedBox(height: 80,),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child:  Image.asset(AssetsConfig.logo,height: 200,width: 205,fit: BoxFit.fill,),
        ),
        // Align(
        // alignment: Alignment(0.0,0.2),
        //     child: SizedBox(
        //       height: 170,
        //       width: 170,
        //       child: CircularProgressIndicator(
        //         strokeWidth: 8,
        //         color: aquaColor,
        //       ))),
        // Align(
        //     alignment: Alignment(0.0,0.2),
        //     child: SizedBox(
        //         height: 180,
        //         width: 180,
        //         child: Transform(
        //           alignment: Alignment.center,
        //           transform: Matrix4.rotationY(math.pi),
        //           child: CircularProgressIndicator(
        //             strokeWidth: 8,
        //             color: redColor,
        //           ),
        //         )))
      ],
    );
  }
}
