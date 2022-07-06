import 'dart:io';

import 'package:fixezi/config/assets_config.dart';
import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/views/authentication/quick_search/quick_search.dart';
import 'package:fixezi/views/authentication/trade_signup/fixezi_contract.dart';
import 'package:fixezi/views/authentication/trade_signup/preview_image.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TradieSignup2 extends StatefulWidget {
  @override
  _TradieSignup2State createState() => _TradieSignup2State();
}

class _TradieSignup2State extends State<TradieSignup2> {
  double hourlyRate = 0;
  double sliderVal = 0.0;
  bool fixedOn = false;
  bool fixedVal = false;
  bool hourlyVal = true;
  int doWorkVal = 1;
  int emerygencyCallOut = 1;
  bool dontRequireContractorLicence = false;
  String erro = '';
  String tradeId = '';
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<JobSearchProvider>(context,listen: false);
    pro.fetchTrade();
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    final jobPro = Provider.of<JobSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Tradie Signup"),
        actions: [
          IconButton(
            onPressed: (){
              showDialog(context: context, builder: (c){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  title: Text("Fixezi Note",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  content: Text("You can edit your 'Company Details' under profile menu",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  actions: [
                    MaterialButton(
                      onPressed: ()=> Navigator.pop(context),
                      color: aquaColor,
                      child: Text("Okay",style: TextStyle(color: Colors.white),),
                    )
                  ],
                  actionsAlignment: MainAxisAlignment.center,
                );
              });
            },
            icon: Icon(Icons.info,color: Colors.red,),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Card(
              //   color: Colors.grey[300],
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Column(
              //         children: [
              //           Text("Once you have signed up and logged in",style: TextStyle(color: pureBlueColor,fontSize: 22,fontWeight: FontWeight.bold),),
              //           Text("You can edit your selection in 'Company Details' under profile menu",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 10,),
              Text("Do you have public liability insurance?",style: GoogleFonts.poppins(color: Colors.white,fontSize: 18),),
              SizedBox(height: 10,),
              Container(
                width: getWidth(context),
                color: Colors.white,
                height: 100,
                child: pro.liabilityinsurancePhoto == '' ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     InkWell(
                       onTap:(){
                         pro.pickImageCamera(1, 1);
                       },
                         child: Image.asset(AssetsConfig.cameraIcon)),
                     SizedBox(width: 10,),
                     InkWell(
                         onTap:(){
                           pro.pickImageCamera(1, 2);
                         },
                         child: Image.asset(AssetsConfig.galleryIcon)),
                  ],
                ):Image.file(File(pro.liabilityinsurancePhoto)),
              ),
              pro.liabilityinsurancePhoto == '' ? Container():
              TextButton(onPressed: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(
                    content: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(1, 1);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Camera"),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(1, 2);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Gallery"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }, child: Text("Change Image",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 10,),
              Text("Do you charge a callout fee?",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20),),
              Row(
                children: [
                  Expanded(
                    child: pro.chargeCalloutFee ? MaterialButton(
                      color: aquaColor,
                      onPressed: (){
                        pro.setButtonVal(1, true);
                      },
                      child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                        pro.setButtonVal(1, true);
                      },
                      child: Text("Yes"),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: pro.chargeCalloutFee == false ? MaterialButton(
                      color: Colors.red,
                      onPressed: (){
                        pro.setButtonVal(1, false);
                      },
                      child: Text("No",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                        pro.setButtonVal(1, false);
                      },
                      child: Text("No"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text("Do you work emergency callouts?",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: pro.emerygencyCallOut? MaterialButton(
                      color: aquaColor,
                      onPressed: (){
                        pro.setButtonVal(2, true);
                      },
                      child: Text("Yes",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                       pro.setButtonVal(2, true);
                      },
                      child: Text("Yes"),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: pro.emerygencyCallOut == false? MaterialButton(
                      color: Colors.red,
                      onPressed: (){
                        pro.setButtonVal(2, false);
                      },
                      child: Text("No",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                        pro.setButtonVal(2, false);
                      },
                      child: Text("No"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text("Do you work",style: GoogleFonts.poppins(color: Colors.white,fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: pro.doYouWork == 1 ? MaterialButton(
                      color: aquaColor,
                      onPressed: (){
                       pro.setButtonVal(3, 1);
                      },
                      child: Text("Residential",style: TextStyle(color: Colors.white),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                        pro.setButtonVal(3, 1);
                      },
                      child: Text("Residential"),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: pro.doYouWork == 2 ? MaterialButton(
                      color: aquaColor,
                      onPressed: (){
                        pro.setButtonVal(3, 2);
                      },
                      child: Text("Commercial",style: TextStyle(color: Colors.white),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                        primary: Colors.white
                      ),

                      onPressed: (){
                        pro.setButtonVal(3, 2);
                      },
                      child: Text("Commercial"),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                    child: pro.doYouWork == 3 ? MaterialButton(
                      color: aquaColor,
                      onPressed: (){
                        pro.setButtonVal(3, 3);
                      },
                      child: Text("Both",style: TextStyle(color: Colors.white),),
                    ):OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 1.0, color: Colors.white),
                          primary: Colors.white
                      ),
                      onPressed: (){
                        pro.setButtonVal(3, 3);
                      },
                      child: Text("Both"),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Select your trades",style: TextStyle(color: Colors.white,fontSize: 22),),
                  // SizedBox(width: 10,),
                  // Expanded(
                  //   child: OutlinedButton(
                  //     style: OutlinedButton.styleFrom(
                  //       side: BorderSide(width: 1.0, color: Colors.white),
                  //     ),
                  //     onPressed: (){},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Text("None Selected"),
                  //         Icon(Icons.keyboard_arrow_down_rounded)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text("Select Trade",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        value: jobPro.selectTrade == '' ? null :jobPro.selectTrade,
                        enableFeedback: true,
                        disabledHint: Text("Select Trade",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                        items: jobPro.tradeList.map((e){
                          return DropdownMenuItem(child: Text(e.tradeName),value: e.tradeName,onTap: (){
                            tradeId = e.tradeId;
                            // pro.fetchProblemByTrade(e.tradeId);
                            // print(e.tradeId);
                          },);
                        }).toList(), onChanged: (c){
                        print(c);
                        jobPro.setTradeVal(c.toString());
                      },
                      )),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("It is critical to select all the trades you are Qualified in!",style: GoogleFonts.poppins(color: Colors.black),textAlign: TextAlign.center,),
                )),
              SizedBox(height: 10,),
              Divider(
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white)
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Please Select your price display for the client",style: TextStyle(color: Colors.black),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your hourly charges",style: TextStyle(fontSize: 22,color: Colors.black),),
                        Checkbox(
                            focusColor: Colors.green,
                            activeColor: Colors.green,
                            hoverColor: Colors.green,
                            checkColor: Colors.white,
                            side: BorderSide(color: Colors.grey),
                            value: hourlyVal, onChanged: (v){
                          setState(() {
                            fixedOn = true;
                            hourlyVal = v!;
                            fixedVal = false;
                          });
                        })
                      ],
                    ),
                    !hourlyVal ? Container():Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Min",style: TextStyle(color: Colors.black),),
                              Expanded(
                                child: Slider(
                                    thumbColor: Colors.red,
                                    activeColor: aquaColor,
                                    value: sliderVal, onChanged: (c){
                                  setState(() {
                                    sliderVal = c;
                                    hourlyRate = sliderVal * 500.toDouble();
                                  });
                                }),
                              ),
                              Text("Max",style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          Text("\$${hourlyRate.round()}",style: TextStyle(fontSize: 20,color: Colors.black),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You only work off fixed prices",style: TextStyle(fontSize: 22,color: Colors.black),),
                        Checkbox(
                            focusColor: Colors.green,
                            activeColor: Colors.green,
                            hoverColor: Colors.green,
                            checkColor: Colors.white,
                            side: BorderSide(color: Colors.grey),
                            value: fixedVal, onChanged: (v){
                          setState(() {
                            fixedOn = true;
                            fixedVal = v!;
                            hourlyVal = false;
                          });
                        })
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.white,
              ),
              // SizedBox(height: 10,),
              // Container(
              //   color: Colors.yellow,
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         Text("Please Add your company images & services",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              //         Text("Once you activated your account can you preview your images in company profile-edit company image's",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text("Please upload clear images for your company logo and services, or you can write them you upload for the client. All information you provide can be edited in your tradie profile after you register.",style: GoogleFonts.poppins(color: Colors.black,),)),
                      // IconButton(onPressed: (){}, icon: Icon(LineIcons.infoCircle,color: Colors.red,))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text("Upload your company image here",style: TextStyle(fontSize: 20),),
              ),
              Container(
                width: getWidth(context),
                color: Colors.white,
                height: 100,
                child: pro.companyImage == '' ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(2, 1);
                        },
                        child: Image.asset(AssetsConfig.cameraIcon)),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(2, 2);
                        },
                        child: Image.asset(AssetsConfig.galleryIcon)),
                  ],
                ):Image.file(File(pro.companyImage)),
              ),
              pro.companyImage == '' ? Container():
              TextButton(onPressed: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(
                    content: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(2, 1);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Camera"),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(2, 2);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Gallery"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }, child: Text("Change Image",style: TextStyle(fontSize: 20),)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text("Upload your company services here",style: TextStyle(fontSize: 20),),
              ),
              Container(
                width: getWidth(context),
                color: Colors.white,
                height: 100,
                child: pro.companyServiceImages.isEmpty? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(3, 1);
                        },
                        child: Image.asset(AssetsConfig.cameraIcon)),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(3, 2);
                        },
                        child: Image.asset(AssetsConfig.galleryIcon)),
                  ],
                ):SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(pro.companyServiceImages.length, (index) => InkWell(
                          onTap: (){
                            nextScreen(context, PreviewImage(path: pro.companyServiceImages[index],index: index,));
                          },
                            child: Image.file(File(pro.companyServiceImages[index])))),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                          onTap:(){
                            pro.pickImageCamera(3, 1);
                          },
                          child: Image.asset(AssetsConfig.cameraIcon)),
                      SizedBox(width: 10,),
                      InkWell(
                          onTap:(){
                            pro.pickImageCamera(3, 2);
                          },
                          child: Image.asset(AssetsConfig.galleryIcon)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text("Upload your contractor licence here",style: TextStyle(fontSize: 20),),
              ),
              Container(
                width: getWidth(context),
                color: Colors.white,
                height: 100,
                child: pro.contactorLicenceImage == '' ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(4, 1);
                        },
                        child: Image.asset(AssetsConfig.cameraIcon)),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(4, 2);
                        },
                        child: Image.asset(AssetsConfig.galleryIcon)),
                  ],
                ):Image.file(File(pro.contactorLicenceImage)),
              ),
              pro.contactorLicenceImage == '' ? Container():
              TextButton(onPressed: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(
                    content: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(4, 1);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Camera"),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(4, 2);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Gallery"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }, child: Text("Change Image",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("We provide boxes for you to upload licenses for each trade you work in, if you do not need a licence for that trade selected please select I do not need a licence for this trade.",style: GoogleFonts.poppins(color: Colors.black),textAlign: TextAlign.center,),
                      // Text("Once you activated your account can you preview your images in company profile-edit company image's",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text("I do not need a contractor licence",style: TextStyle(fontSize: 18,color: Colors.white),)),
                  Checkbox(
                      focusColor: Colors.white,
                      activeColor: Colors.grey,
                      hoverColor: Colors.white,
                      checkColor: Colors.white,
                      side: BorderSide(color: Color(0xff585858)),
                      value: dontRequireContractorLicence, onChanged: (v){
                    setState(() {
                      dontRequireContractorLicence = !dontRequireContractorLicence;
                    });
                  })
                ],
              ),
              const SizedBox(height: 10,),
              const Text("To verify your identity, we need a copy of your drivers licence.",style: TextStyle(fontSize: 20),),
              const SizedBox(height: 10,),
              Container(
                width: getWidth(context),
                color: Colors.white,
                height: 100,
                child: pro.driverLicenceImage == '' ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(5, 1);
                        },
                        child: Image.asset(AssetsConfig.cameraIcon)),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap:(){
                          pro.pickImageCamera(5, 2);
                        },
                        child: Image.asset(AssetsConfig.galleryIcon)),
                  ],
                ):Image.file(File(pro.driverLicenceImage)),
              ),
              pro.driverLicenceImage == '' ? Container():
              TextButton(onPressed: (){
                showDialog(context: context, builder: (ctx){
                  return AlertDialog(
                    content: Container(
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(5, 1);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Camera"),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          InkWell(
                            onTap:(){
                              pro.pickImageCamera(5, 2);
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text("Gallery"),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
              }, child: Text("Change Image",style: TextStyle(fontSize: 20),)),
              SizedBox(height: 10,),
              MaterialButton(child: Text("Click here to read and agree to the tradie T&C’s"), color: Colors.yellow, onPressed: ()=> nextScreen(context, FixeziContract()),textColor: Colors.black,),
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
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      height: 40,
                      color: Colors.red,
                      onPressed: (){},
                      child: Text("Cancel",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: MaterialButton(
                      height: 40,
                      color: aquaColor,
                      onPressed: (){
                        setState(() {
                          erro = "";
                        });
                        if(pro.liabilityinsurancePhoto == ''){
                          setState(() {
                            erro = "Choose Liability Licence Photo";
                          });
                        }else if(pro.companyImage == ''){
                          setState(() {
                            erro = "Choose Company Photo";
                          });
                        }else if(pro.companyServiceImages.isEmpty){
                          setState(() {
                            erro = "Choose Company Service Images";
                          });
                        }else if(pro.contactorLicenceImage == ''){
                          setState(() {
                            erro = "Choose Contractor Licence Image";
                          });
                        }else if(pro.driverLicenceImage == ''){
                          setState(() {
                            erro = "Choose Driver Licence Image";
                          });
                        }else if(!pro.phoneVerified){
                          setState(() {
                            erro = "Please Verify Phone";
                          });
                        }else{
                          pro.signUpTradie(tradeId);
                          // nextScreen(context, TradieBottom());
                        }
                      },
                      child: Text("Register",style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
