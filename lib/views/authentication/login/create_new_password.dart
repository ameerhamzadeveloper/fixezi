import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/login/enter_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../components/fixezi_logo.dart';
class CreateNewPassword extends StatefulWidget {
  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {

  String password = '';
  String confPassword = '';
  String error = '';

  GlobalKey<FormState> stateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text("Create Password"),
          leading: BackButton(
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
        ),
      ),
      body: Container(
        height: getHeight(context),
        child: SingleChildScrollView(
          child: Form(
            key: stateKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FixeziLogoWidget(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Text("New user or Tradie?\nPlease sign up",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,),textAlign: TextAlign.center,),
                // ),
                SizedBox(height: 70,),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(LineIcons.lock),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "New Password",
                                        border: InputBorder.none
                                    ),
                                    validator: (c){
                                      if(c!.isEmpty){
                                        return "Password is required";
                                      }else {
                                        return null;
                                      }
                                    },
                                    onChanged: (v){
                                      password = v;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(LineIcons.lock),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "Confirm Password",
                                        border: InputBorder.none
                                    ),
                                    validator: (c){
                                      if(c!.isEmpty){
                                        return "Confirm Password is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (v){
                                      confPassword = v;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text(error,style: TextStyle(color: Colors.red),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.red,
                          onPressed: (){
                            setState(() {
                              error = "";
                            });
                            if(stateKey.currentState!.validate()){
                              // nextScreen(context, EnterOTP());
                              if(password != confPassword){
                                setState(() {
                                  error = "Confrim Password Must be match";
                                });
                              }else{

                              }
                            }
                            // nextScreen(context, TradeSignupNote1());
                          },
                          child:  Text("Done",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
