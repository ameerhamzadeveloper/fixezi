import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/user_signup/address.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/user/user_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  String dropVal = "+60";
  bool isPhoneDialogueOpen = false;
  bool phoneVerified = false;
  bool emailVerified = false;
  bool isEmailDialogueOpen = false;
  String erro = '';
  String password = '';

  GlobalKey<FormState> key = GlobalKey<FormState>();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Fixezi",style: GoogleFonts.leagueSpartan(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.edit,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Full Name",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Full Name is required";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(1, v);
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
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.mapMarker,color: Colors.grey,),
                          SizedBox(width: 5,),
                          pro.businessAddress == '' ? Expanded(
                            child: TextField(
                              readOnly: true,
                              onTap: ()=> nextScreen(context, Address()),
                              decoration: const InputDecoration(
                                  hintText: "Address",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                            ),
                          ):Expanded(
                            child: TextField(
                              readOnly: true,
                              controller: TextEditingController(text: pro.businessAddress),
                              onTap: ()=> nextScreen(context, Address()),
                              decoration: const InputDecoration(
                                  hintText: "Address",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
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
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.phone,color: Colors.grey,),
                          SizedBox(width: 5,),
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              onChanged: (v){
                                pro.changeDropVal(v.toString(),2);
                              },
                              value: pro.phoneDropDown2,
                              items: [
                                DropdownMenuItem(
                                  child: Text("+1"),
                                  value: "+1",
                                ),
                                DropdownMenuItem(
                                  child: Text("+44"),
                                  value: "+44",
                                ),
                                DropdownMenuItem(
                                  child: Text("+60"),
                                  value: "+60",
                                ),
                                DropdownMenuItem(
                                  child: Text("+61"),
                                  value: "+61",
                                ),
                                DropdownMenuItem(
                                  child: Text("+64"),
                                  value: "+64",
                                ),
                                DropdownMenuItem(
                                  child: Text("+65"),
                                  value: "+65",
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  hintText: "Mobile Phone",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Mobile is required";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(7, v);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pro.phoneVerified == true ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Verified",style: TextStyle(color: Colors.white),),
                        Icon(LineIcons.checkCircle,color: Colors.green,),
                      ],
                    ),
                  ) :pro.isPhoneDialogueOpen ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: TextField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  hintText: "OTP",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              onChanged: (v){
                                pro.setUserOTp(v);
                              },
                            ),
                          ),
                        ),
                      ),
                      TextButton(onPressed: (){
                        if(pro.userOTP != pro.otp){
                          showDialog(context: context, builder: (c){
                            return AlertDialog(
                              title: Text("Invalid OTP"),
                              actions: [
                                TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Try Again"))
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            );
                          });
                        }else{
                          pro.changePhoneVerified();
                        }
                      }, child: Text("Verify")),
                      TextButton(onPressed: (){
                        pro.sendOTPMobile();
                      }, child: Text("Resend OTP"))
                    ],
                  ):TextButton(onPressed: (){
                    FocusManager.instance.primaryFocus?.unfocus();
                    showDialog(context: context, builder: (ctx){
                      return AlertDialog(
                        title: Text("Verify Phone"),
                        content: Text("Are you sure this phone is correct to receive OTP code"),
                        actions: [
                          TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                            pro.changePhoneDialogueOpen();
                          }, child: Text("Yes")),
                        ],
                      );
                    });
                  }, child: Text("Click here to verify phone")),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.envelope,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              // readOnly: true,
                              // onTap: ()=> nextScreen(context, Address()),
                              decoration: const InputDecoration(
                                  hintText: "Email",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Email is required";
                                }else {
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
                  // emailVerified == true ? Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Verified"),
                  //     Icon(LineIcons.checkCircle,color: Colors.green,),
                  //   ],
                  // ) :isEmailDialogueOpen ? Row(
                  //   children: [
                  //     Container(
                  //       width: 200,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(10),
                  //           color: Colors.grey[300]
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(left:8.0),
                  //         child: TextField(
                  //           decoration: const InputDecoration(
                  //               hintText: "OTP",
                  //               border: InputBorder.none,
                  //               hintStyle: TextStyle(color: Colors.grey)
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     TextButton(onPressed: (){
                  //       setState(() {
                  //         emailVerified = true;
                  //         print(emailVerified);
                  //       });
                  //     }, child: Text("Verify"))
                  //   ],
                  // ):TextButton(onPressed: (){
                  //   showDialog(context: context, builder: (ctx){
                  //     return AlertDialog(
                  //       title: Text("Verify Email"),
                  //       content: Text("Are you sure this Email is correct to receive OTP code"),
                  //       actions: [
                  //         TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
                  //         TextButton(onPressed: (){
                  //           Navigator.pop(context);
                  //           setState(() {
                  //             isEmailDialogueOpen = true;
                  //           });
                  //         }, child: Text("Yes")),
                  //       ],
                  //     );
                  //   });
                  // }, child: Text("Click here to verify Email")),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.lock,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              // readOnly: true,
                              // onTap: ()=> nextScreen(context, Address()),
                              decoration: const InputDecoration(
                                  hintText: "Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Password is required";
                                }else if(c.length < 6){
                                  return "Password Must be 6 character";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(9, v);
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
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.lock,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              // readOnly: true,
                              // onTap: ()=> nextScreen(context, Address()),
                              decoration: const InputDecoration(
                                  hintText: "Confirm Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Password is required";
                                }else if(c.length < 6){
                                  return "Password Must be 6 character";
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

                  Row(
                    children: [
                      Expanded(child: Text("Would you like to receive sms/emails for discounts or trades related content?")),
                      Checkbox(
                        value: pro.wouldyouliketoReceiveEmailsSmsVal,
                        onChanged: (v){
                          pro.assignAllowMessageSMs();
                        },
                      )
                    ],
                  ),
                  Text(erro,style: TextStyle(color: Colors.red),),
                  SizedBox(height: 30,),
                  FixeziButton(title: "Register", color: aquaColor, onTap: (){
                    setState(() {
                      erro = "";
                    });
                    if(key.currentState!.validate()){
                      if(password != pro.password){
                        setState(() {
                          erro = "Confirm Password must be match";
                        });
                      }else if(pro.businessAddress == ''){
                        setState(() {
                          erro = "Choose Address";
                        });
                      }else if(!pro.phoneVerified){
                        setState(() {
                          erro = "Please Verify Phone";
                        });
                      }else{
                        pro.signupUser(context);
                        showDialog(
                            barrierDismissible: false,
                            context: context, builder: (c){
                          return CupertinoAlertDialog(
                            title: Text("Please Wait"),
                            content: CupertinoActivityIndicator(),
                          );
                        });
                      }
                    }
                  }, textColor: Colors.white),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(onPressed:(){},child: Text("Login"))
                    ],
                  ),
                  // TextButton(onPressed: ()=> nextScreen(context, UserBottom()), child: Text("USer Home"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
