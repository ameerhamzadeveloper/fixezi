import 'package:fixezi/constants.dart';
import 'package:fixezi/views/authentication/login/enter_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../provider/signup_provider.dart';
import '../../components/fixezi_logo.dart';
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
          title: Text("Forgot Password"),
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
                                Icon(LineIcons.envelope),
                                SizedBox(width: 5,),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        border: InputBorder.none
                                    ),
                                    validator: (c){
                                      if(c!.isEmpty){
                                        return "Email is required";
                                      }else if (!RegExp(
                                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(c)) {
                                        return 'Please enter a valid email Address';
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (v){
                                      pro.assignValues(8, v);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(pro.error,style: TextStyle(color: Colors.red),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        pro.isLoading ? const Center(child: CircularProgressIndicator(),):MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.red,
                          onPressed: (){
                            if(stateKey.currentState!.validate()){
                              // nextScreen(context, EnterOTP());
                              pro.sendOTPEmail(context);
                            }
                            // nextScreen(context, TradeSignupNote1());
                          },
                          child:  Text("Send Code",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
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
