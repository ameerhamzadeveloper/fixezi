
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/user_job_provider.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/components/tradesman_rating_compoments.dart';
import 'package:fixezi/views/tradie/add_job_notes.dart';
import 'package:fixezi/views/tradie/add_quote.dart';
import 'package:fixezi/views/tradie/make_job_invoice.dart';
import 'package:fixezi/views/tradie/start_job.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';
import '../components/fixezi_button.dart';
import '../components/rating_component.dart';
class JobRequestDetials extends StatefulWidget {
  final int index;

  const JobRequestDetials({Key? key,required this.index}) : super(key: key);
  @override
  _JobRequestDetialsState createState() => _JobRequestDetialsState();
}

class _JobRequestDetialsState extends State<JobRequestDetials> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserJobProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    final tradPro = Provider.of<TradieJobsProvider>(context);
    var d = pro.userJobRequestJobs![widget.index];
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Detail"),
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
                        Text("INPROGRESS",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("Problem : ${d.problemName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date : ${dateFormat.format(DateTime.parse(d.jobDateTime!))}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("Flexible : ${d.isDateFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Time: ${d.jobStartTime!}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
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
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job Address : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.address}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Home Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.otherPhoneNumber}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.phoneNumber}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Job Request  : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 30,),
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
              const SizedBox(height: 10,),
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
                        Text("Tradie Details",style: GoogleFonts.poppins(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold),),
                        // Text("INPROGRESS",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Business Name : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.tradeMan!.businessName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Abn : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${ d.tradeMan!.abn}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Office PH : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.tradeMan!.officePhone}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Mobile Ph : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("${d.tradeMan!.mobileNumber}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Business Address : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text(d.tradeMan!.businessAddress!,style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text(d.tradeMan!.email!,style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                  ],
                ),
              ),SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Rating Overview",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
              //     // Text("job@done.c \om",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
              //   ],
              // ),
              // SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("${d.tradeMan!.avgRating}",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32),),
              //     Text("/5",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
              //   ],
              // ),
              // SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TradesManRatingComponents(totalRating: int.parse(d.tradeMan!.totalRating!)),
              //   ],
              // ),
              // SizedBox(height: 10,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text("Total Rated",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
              //     Text(" (${d.tradeMan!.totalRating})",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
              //   ],
              // ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FixeziButton(color: Color(0xffFFE604),onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to Reschedule Job?"),
                          content: Text("Rescheduling Job Date Time will be Update job Date Time"),
                          actions: [
                            MaterialButton(
                              color:Colors.red,
                              onPressed: ()=> Navigator.pop(context),
                              child: Text("No",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              color:aquaColor,
                              onPressed: (){
                                // Navigator.pop(context);
                                pro.changeJobDate(context, widget.index, d.jobId!, authPro.userId);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("Reschedule",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    },textColor: Colors.black,title: "Reschedule"),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: Colors.white,onTap: (){
                      tradPro.setAllJobCurrentId(d.jobId!);
                      nextScreen(context,AddJobNotes(index: widget.index));
                    },textColor: Colors.black,title: "Add Notes"),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FixeziButton(color: Colors.red,onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to Cancel this Job?"),
                          content: Text("Canceling job will be remove from current working job"),
                          actions: [
                            MaterialButton(
                              color:Colors.red,
                              onPressed: ()=> Navigator.pop(context),
                              child: Text("No",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              color:aquaColor,
                              onPressed: (){
                                // Navigator.pop(context);
                                pro.changeJobStatus('5','CANCELLED');
                                Navigator.pop(context);
                                pro.fetchJobs(authPro.userId, '2', 2);
                                pro.fetchJobs(authPro.userId, '1', 1);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    },textColor: Colors.white,title: "Cancel Job"),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: Colors.lightBlueAccent,onTap: (){

                    },textColor: Colors.white,title: "Set Reminder"),
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
