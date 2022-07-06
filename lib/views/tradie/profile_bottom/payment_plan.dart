import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/tradie/plan_chosed.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../provider/signup_provider.dart';

class PaymentPlan extends StatefulWidget {
  final bool isFromBottom;

  const PaymentPlan({Key? key,required this.isFromBottom}) : super(key: key);
  @override
  _PaymentPlanState createState() => _PaymentPlanState();
}

class _PaymentPlanState extends State<PaymentPlan> {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: Container(),
        title: Text("Payment Plan"),
        actions: [
          IconButton(
            icon: Icon(Icons.info,color: Colors.red,size: 30,),
            onPressed: (){
              showDialog(context: context, builder: (ct){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  title: Text("Fixezi Note",textAlign: TextAlign.center,),
                  content: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        Text("When you have marked a job as"),
                        Text("‘incomplete’",style: TextStyle(color: blueColor),),
                        Text("it is moved to the ‘Jobs Pending’ location.",textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: MaterialButton(
                        height: 30,
                        color:aquaColor,
                        onPressed: ()=> Navigator.pop(context),
                        child: Text("Ok",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                );
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Pay per Job Plans",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(
                height: getHeight(context) / 1.7,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: getWidth(context) - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Basic",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("\$9.95 Per Job",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Only pay when you accept a job",style: GoogleFonts.poppins(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text("All Features on basic Plan Are:",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("Your Company is Shown to all clients who live whithin your service location.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can upload 1 image for your company logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can edit your information 2 time total.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You have refunds on cancelled jobs and cancelled quotes.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You have all functions for jobs.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can make 1 total employee ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can accept unlimited jobs pay \$9.95 per job.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                FixeziButton(title: "Select Plan", color: Colors.black, onTap: (){
                                  if(!widget.isFromBottom){
                                    pro.choosePlan('1', authPro.userId,authPro.token);
                                    nextScreen(context, ChoosedPlanPage());
                                  }
                                }, textColor: Colors.white)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    SizedBox(
                      height: getHeight(context) / 1.7,
                      child: Container(
                        width: getWidth(context) - 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red)
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text("Smooth operator",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                    Text("\$14.95 Per Job",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                    Text("Only pay when you accept a job",style: GoogleFonts.poppins(fontSize: 14),),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Text("All Basic features,plus :",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                  SizedBox(height: 10,),
                                  Text("Ability to upload 3 photos for logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("Add 3 Photos of previous work.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("Add Website link for clients to view your website.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("Add 1 video to display your times total.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("Show to new clients that you are recommended by past clients.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("You can make 4 total employe ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 10,),
                                  Text("You can accept unlimited jobs pay \$14.95 per job.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                  SizedBox(height: 20,),
                                  SizedBox(height: 10,),
                                  FixeziButton(title: "Select Plan", color: Colors.red, onTap: (){
                                    if(!widget.isFromBottom){
                                      pro.choosePlan('2', authPro.userId,authPro.token);
                                      nextScreen(context, ChoosedPlanPage());
                                    }
                                  }, textColor: Colors.white)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: getWidth(context) - 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: pureBlueColor)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: pureBlueColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Like a rolling stone",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("\$22.95 Per Job",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Only pay when you accept a job",style: GoogleFonts.poppins(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text("All Basic & Smooth operator features,plus : ",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("You can upload 3 image for your company logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add total of 6 photo's of previous work.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add 2 video to display your company.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can edit your information 10 times.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can make 8 total employee ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can accept unlimited jobs pay \$22.95 per job.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                SizedBox(height: 10,),
                                FixeziButton(title: "Select Plan", color: pureBlueColor, onTap: (){
                                  if(!widget.isFromBottom){
                                    pro.choosePlan('3', authPro.userId,authPro.token);
                                    nextScreen(context, ChoosedPlanPage());
                                  }
                                }, textColor: Colors.white)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Subscriptions",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(
                height: getHeight(context) / 1.7,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: getWidth(context) - 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Hit the ground running",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("\$49.95",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Locked in for 1 month",style: GoogleFonts.poppins(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text("All Features on Hit the ground running Are:",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("Your company is shown to all clients who live wihtin your service location.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can upload 1 image for your company logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can edit your information 2 times total.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("No refunds on cancelled jobs and cancelled quotes.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You have all functions for jobs.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can make 1 total employee ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Total of 20 jobs in 1 month.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                SizedBox(height: 10,),
                                FixeziButton(title: "Select Plan", color: Colors.black, onTap: (){
                                  if(!widget.isFromBottom){
                                    pro.chooseMonthlyPlan('4', authPro.userId,authPro.token);
                                    nextScreen(context, ChoosedPlanPage());
                                  }
                                }, textColor: Colors.white)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: getWidth(context) - 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Like a rolling stone",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("\$89.95",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Locked in for 2 months",style: GoogleFonts.poppins(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text("All Hit the ground running features, plus:",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("You can upload 3 image for your company logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add 3 photos of previous work.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add website link for clients to view your website.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can edit your information 4 times total.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Show to new clients that you are recommeneded by past clients.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can make 4 total employe ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Total of 50 jobs in 2 month.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                SizedBox(height: 10,),
                                FixeziButton(title: "Select Plan", color: Colors.red, onTap: (){
                                  if(!widget.isFromBottom){
                                    pro.chooseMonthlyPlan('5', authPro.userId,authPro.token);
                                    nextScreen(context, ChoosedPlanPage());
                                  }
                                }, textColor: Colors.white)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      width: getWidth(context) - 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: pureBlueColor)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: pureBlueColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text("Fire on all cylinders",style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.bold),),
                                  Text("\$129.95",style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
                                  Text("Locked in for 4 months",style: GoogleFonts.poppins(fontSize: 14),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text("All Hit the ground & Like a rolling stone features, plus:",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("You can upload 3 image for your company logo/header.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add 6 photos of previous work.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Add 1 video to display your company.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can edit your information 10 times total.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Show to new clients that you are recommeneded by past clients.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("You can make 8 total employe ID's.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 10,),
                                Text("Unlimited jobs.",style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),
                                SizedBox(height: 20,),
                                SizedBox(height: 10,),
                                FixeziButton(title: "Select Plan", color: pureBlueColor, onTap: (){
                                  if(!widget.isFromBottom){
                                    pro.chooseMonthlyPlan('6', authPro.userId,authPro.token);
                                    nextScreen(context, ChoosedPlanPage());
                                  }
                                }, textColor: Colors.white)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}