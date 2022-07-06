import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/login/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../components/fixezi_logo.dart';
class LoginUSer extends StatefulWidget {
  final String text;
  final Color color;

  const LoginUSer({Key? key,required this.text,required this.color}) : super(key: key);
  @override
  _LoginUSerState createState() => _LoginUSerState();
}

class _LoginUSerState extends State<LoginUSer> {
  GlobalKey<FormState> stateKey = GlobalKey<FormState>();
  bool isObsecure = true;

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<SignupProvider>(context,listen: false);
    pro.initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text("Login"),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pro.error,style: TextStyle(color: Colors.red),),
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
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            isObsecure = !isObsecure;
                                          });
                                        },
                                        icon: Icon(isObsecure ? LineIcons.eyeSlash:LineIcons.eye),
                                      )
                                    ),
                                    onChanged: (v){
                                      pro.assignValues(9, v);
                                    },
                                    validator: (c){
                                      if(c!.isEmpty){
                                        return "Password is required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    obscureText: isObsecure,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              nextScreen(context, ForgotPassword());
                            }, child: Text("Forgot Password?",style: TextStyle(color: Colors.black),))
                          ],
                        ),
                        pro.isLoading ? const Center(child: CircularProgressIndicator(),):MaterialButton(
                          height: 50,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          color: widget.color,
                          onPressed: (){
                            if(stateKey.currentState!.validate()){
                              pro.loginUser(context);
                            }
                            // nextScreen(context, TradeSignupNote1());
                          },
                          child:  Text(widget.text,style: GoogleFonts.poppins(color: Colors.white,fontSize: 22),),
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
