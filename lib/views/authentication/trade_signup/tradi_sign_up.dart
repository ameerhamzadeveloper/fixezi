import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/trade_signup/map_radius.dart';
import 'package:fixezi/views/authentication/trade_signup/tradie_signup_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../constants.dart';
import '../user_signup/address.dart';
class TradiSignUp extends StatefulWidget {
  @override
  _TradiSignUpState createState() => _TradiSignUpState();
}

class _TradiSignUpState extends State<TradiSignUp> {
  String erro = '';
  String password  ='';
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
      // backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Tradesman signup",style: GoogleFonts.leagueSpartan(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      TextButton(onPressed: (){}, child: Text("Get Started Today")),
                      Text("only \$9.95 for any job you accept",style: TextStyle(color: Colors.white),)
                    ],
                  ),
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
                                  hintText: "Business Name",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Business Name is required";
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
                          Icon(LineIcons.edit,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Trading Name (Optional)",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              // validator: (val){
                              //   if(val!.isEmpty){
                              //     return "Business Name is required";
                              //   }else {
                              //     return null;
                              //   }
                              // },
                              onChanged: (v){
                                pro.assignValues(2, v);
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
                          Icon(LineIcons.edit,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Abn",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Abn is required";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(3, v);
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
                          Icon(LineIcons.edit,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Business Owner's Name",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (val){
                                if(val!.isEmpty){
                                  return "Business Owner is required";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(4, v);
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
                                  hintText: "Business Address",
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
                                  hintText: "Business Address",
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
                                pro.changeDropVal(v.toString(),1);
                              },
                              value: pro.phoneDropDown,
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
                                  hintText: "Office Phone",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c!.isEmpty){
                                  return "Office Phone is required";
                                }else {
                                  return null;
                                }
                              },
                              onChanged: (v){
                                pro.assignValues(6, v);
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
                          showDialog(
                              context: context, builder: (c){
                           return AlertDialog(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)
                             ),
                              title: Text("Invalid OTP",textAlign: TextAlign.center,),
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
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
                  // pro.emailVerified == true ? Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("Verified"),
                  //     Icon(LineIcons.checkCircle,color: Colors.green,),
                  //   ],
                  // ) :pro.isEmailDialogueOpen ? Row(
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
                  //         pro.changeEmailVerified();
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
                  //           pro.changeEmialDialogueOpen();
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
                              decoration: const InputDecoration(
                                  hintText: "Confirm Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              validator: (c){
                                if(c != pro.password){
                                  return "Password must be match";
                                }else{
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
                        color: Colors.grey[300]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0),
                      child: Row(
                        children: [
                          Icon(LineIcons.globe,color: Colors.grey,),
                          SizedBox(width: 5,),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                  hintText: "Company Website URI (optional)",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey)
                              ),
                              onChanged: (v){
                                pro.assignValues(10, v);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Please Enter your serving location",style: TextStyle(color: Colors.white),),
                  Divider(color: Colors.white,),
                  ListTile(
                    onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();nextScreen(context, MapRadius());},
                    title: Text("Location",style: TextStyle(color: Colors.white)),
                    trailing: Container(
                      width: 95,
                      child: Row(
                        children: [
                          Expanded(child: Text(pro.businessAddress == '' ? "Perth Region":pro.businessAddress,style: TextStyle(color: Colors.white),)),
                          Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 18,)
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.white,),
                  ListTile(
                    title: Row(
                      children: [
                        Text("Distance",style: TextStyle(color: Colors.white,fontSize: 16)),
                        Slider(
                          thumbColor: Colors.grey,
                            activeColor: aquaColor,
                            value: pro.radisu / 10000, onChanged: (v){

                        })
                      ],
                    ),
                    trailing: Text("${(pro.radisu / 100).round()} KM",style: TextStyle(color: Colors.white),),
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("Would you like to receive sms/emails for discounts or trades related content?",style: TextStyle(color: Colors.white),)),
                      Checkbox(
                        focusColor: Colors.white,
                        activeColor: Colors.grey,
                        hoverColor: Colors.white,
                        checkColor: Colors.white,
                        side: BorderSide(color: Color(0xff585858)),
                        value: pro.wouldyouliketoReceiveEmailsSmsVal,
                        onChanged: (v){
                          pro.assignAllowMessageSMs();
                        },
                      )
                    ],
                  ),
                  erro == '' ? Container():Container(
                    color: Colors.yellow,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.info,color: Colors.red,),
                          SizedBox(width: 10,),
                          Text(erro,style: TextStyle(color: Colors.red),textAlign: TextAlign.start,),
                        ],
                      )),
                  SizedBox(height: 30,),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: aquaColor,
                    onPressed: (){
                      setState(() {
                        erro = "";
                      });
                      if(key.currentState!.validate()){
                        if(pro.businessAddress == ''){
                          setState(() {
                            erro = "Choose your Address";
                          });
                        }else if(password != pro.password){
                          setState(() {
                            erro = "Confirm Password must be match";
                          });
                        }else{
                          nextScreen(context, TradieSignup2());
                        }
                      }
                      //
                    },
                    child:  Text("Continue",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                  Row(
                    children: [
                      Text("Already have an account?",style: TextStyle(color: Colors.white),),
                      TextButton(onPressed:(){},child: Text("Login"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
