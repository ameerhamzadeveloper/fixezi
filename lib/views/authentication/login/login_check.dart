import 'package:fixezi/views/authentication/login/login_user.dart';
import 'package:fixezi/views/components/fixezi_logo.dart';
import 'package:fixezi/views/employee/employe_bottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/assets_config.dart';
import '../../../config/colors.dart';
import '../../../constants.dart';
class LoginCheck extends StatefulWidget {
  const LoginCheck({Key? key}) : super(key: key);
  @override
  _LoginCheckState createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text("Login"),
          leading: BackButton(
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: Colors.black,
          //     borderRadius: BorderRadius.only(
          //       bottomRight: Radius.circular(20),
          //       bottomLeft: Radius.circular(20),
          //     )
          //   ),
          // ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FixeziLogoWidget(),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("New user or Tradie?\nPlease sign up",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,),textAlign: TextAlign.center,),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.red,
                  onPressed: (){
                    nextScreen(context, LoginUSer(text: "Login as User",color: Colors.red,));
                  },
                  child:  Text("Login as User",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: pureBlueColor,
                  onPressed: (){
                    nextScreen(context, LoginUSer(text: "Login as Tradie",color: pureBlueColor,));
                  },
                  child:  Text("Login as Tradie",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                ),
                SizedBox(height: 10,),
                MaterialButton(
                  height: 50,
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.black,
                  onPressed: (){
                    nextScreen(context, LoginUSer(text: "Login as Employee",color: Colors.black,));
                  },
                  child:  Text("Login as Employee",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                ),
                SizedBox(height: 15,)
              ],
            )
          )
        ],
      ),
    );
  }
}
