import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/components/rating_component.dart';
import 'package:fixezi/views/employee/employe_bottom.dart';
import 'package:fixezi/views/tradie/plan_chosed.dart';
import 'package:fixezi/views/tradie/profile_bottom/payment_plan.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
import '../../utils/urls.dart';
class IncommingJobDetails extends StatefulWidget {
  final int index;
  final bool isFromEmploye;

  const IncommingJobDetails({Key? key,required this.index,required this.isFromEmploye}) : super(key: key);
  @override
  _IncommingJobDetailsState createState() => _IncommingJobDetailsState();
}

class _IncommingJobDetailsState extends State<IncommingJobDetails> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  void initState() {
    super.initState();
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    pro.fetchCurrentPlan(authPro.userId,authPro.token);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    var d = pro.jobRequest![widget.index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Job Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job ${d.jobId}",style: GoogleFonts.poppins(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                        Text("IN PROGRESS",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Problem : ${d.problemName},${d.tradeName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date : ${dateFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("Flexible : ${d.isDateFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time: ${timeFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("Flexible : ${d.isTimeFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time Flexibility : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.timeFlexibilty}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Person on site : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.personOnSite}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job Addressess : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid? d.address : "**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Home Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid ? d.otherPhoneNumber:"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid?d.phoneNumber:"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job Request  : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Admin Note  : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Bill Payer",style: GoogleFonts.poppins(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                        // Text("INPROGRESS",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.personOnSite}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Address : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid ? d.address:"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Other PH : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid ? d.otherPhoneNumber:"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid ? d.phoneNumber:"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${pro.isPaid ? "**********":"**********"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                  ],
                ),
              ),SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Client Rating",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  // Text("job@done.c \om",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Easily Contacted",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: int.parse(d.clientRating!.easilyContacted!)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Easy to work for",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: int.parse(d.clientRating!.easilyWorkFor!)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment on Completion",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  RatingComponents(totalRating: int.parse(d.clientRating!.paymentOnCompletion!)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jobs Completed/Cancelled",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  Text("${d.clientRating!.totalCompletedCancelJob}",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quotes Accepted/Cancelled",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  Text("${d.clientRating!.totalQuoteAcceptedRejected}",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 30,),
              // SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FixeziButton(color: Colors.red,onTap: (){
                      pro.changeJobStatus('2', 'REJECTED');
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => TradieBottom(index: 1,)), (route) => false);
                      pro.fetchJobs(authPro.userId, '1', Urls.fetchJobUrl, 1);
                      pro.fetchJobs(authPro.userId, '2', Urls.fetchJobUrl, 2);
                    },textColor: Colors.white,title: "Reject"),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: aquaColor,onTap: (){
                      if(widget.isFromEmploye){
                        pro.acceptEmployeJob(d.jobId!, authPro.userId);
                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => EmployeeBottom(index: 1,)), (route) => false);
                      }else{
                        if(pro.currentPlan == null){
                          showDialog(
                              context: context, builder: (c){
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              title: Text("Fixezi Note",textAlign: TextAlign.center,),
                              content: Container(
                                height: 120,
                                child: Column(
                                  children: [
                                    Text("You do not have a payment plan yet.\nTo see the clients details, please select ‘Accept’ to choose a payment plan.",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
                                  ],
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  onPressed: ()=> Navigator.pop(context),
                                  color: Colors.red,
                                  child: Text("Cancel",style: TextStyle(color: Colors.white),),
                                  minWidth: 100,
                                ),
                                SizedBox(width: 20,),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                    pro.setJobIndex(widget.index);
                                    nextScreen(context, PaymentPlan(isFromBottom: false,));
                                  },
                                  color: aquaColor,
                                  child: Text("Accept",style: TextStyle(color: Colors.white),),
                                  minWidth: 100,
                                ),
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                            );
                          });
                        }else{
                          nextScreen(context, ChoosedPlanPage());
                        }
                      }
                    },textColor: Colors.white,title: "Accept"),
                  ),
                ],
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
