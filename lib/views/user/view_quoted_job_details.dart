
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/user_job_provider.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/components/tradesman_rating_compoments.dart';
import 'package:fixezi/views/tradie/add_job_notes.dart';
import 'package:fixezi/views/tradie/add_quote.dart';
import 'package:fixezi/views/tradie/make_job_invoice.dart';
import 'package:fixezi/views/tradie/start_job.dart';
import 'package:fixezi/views/tradie/tradie_bottom.dart';
import 'package:fixezi/views/user/view_job_quote.dart';
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
class JobQuotedDetails extends StatefulWidget {
  final int index;

  const JobQuotedDetails({Key? key,required this.index}) : super(key: key);
  @override
  _JobQuotedDetailsState createState() => _JobQuotedDetailsState();
}

class _JobQuotedDetailsState extends State<JobQuotedDetails> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  int daysLeft = 0;
  DateTime d = DateTime.now();

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<UserJobProvider>(context,listen: false);
    pro.fetchJobQuote();
    Future.delayed(Duration(seconds: 1),(){
      int days = int.parse(pro.jobQuote![0].days!);
      var total = days - d.difference(pro.jobQuote![0].dateTime!).inDays;
      daysLeft = total;
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Fixezi note",textAlign: TextAlign.center,),
          content: Text("This Quote will expire in $daysLeft Days Please scroll to the bottom of this screen for more options."),
          actions: [
            MaterialButton(
              color:aquaColor,
              onPressed: (){
                // Navigator.pop(context);
                Navigator.pop(context);
                // pro.changeJobTime(context, d.jobId!, authPro.userId);
              },
              child: Text("Okay",style: TextStyle(color: Colors.white),),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserJobProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    final tradPro = Provider.of<TradieJobsProvider>(context);
    var d = pro.userPendingJobs![widget.index];
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
                        Text(d.statusText!,style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Problem : ${d.problemName},${d.tradeName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Rating Overview",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                  // Text("job@done.c \om",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${d.tradeMan!.avgRating}",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 32),),
                  Text("/5",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TradesManRatingComponents(totalRating: int.parse(d.tradeMan!.totalRating!)),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Rated",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                  Text(" (${d.tradeMan!.totalRating})",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 20),),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: FixeziButton(color: Colors.red,onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to cancel Quote for this job?",textAlign: TextAlign.center,),
                          content: Text("Cancel Quote will be cancel your job"),
                          actions: [
                            MaterialButton(
                              color:Colors.red,
                              onPressed: (){
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("No",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              color:aquaColor,
                              onPressed: (){
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                pro.changeJobQuotesStatus(pro.jobQuote![0].jobQuoteId!, '2', authPro.userId);
                                Navigator.pop(context);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("Yes",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    },textColor: Colors.white,title: "Cancel Quote"),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: aquaColor,onTap: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to cancel Quote for this job?",textAlign: TextAlign.center,),
                          content: Text("Cancel Quote will be cancel your job"),
                          actions: [
                            MaterialButton(
                              color:Colors.red,
                              onPressed: (){
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("No",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              color: aquaColor,
                              onPressed: (){
                                // Navigator.pop(context);
                                Navigator.pop(context);
                                pro.changeJobQuotesStatus(pro.jobQuote![0].jobQuoteId!, '3', authPro.userId);
                                Navigator.pop(context);
                                // pro.changeJobTime(context, d.jobId!, authPro.userId);
                              },
                              child: Text("Yes",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    },textColor: Colors.white,title: "Accept Quote"),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FixeziButton(color: Colors.white,onTap: (){
                      nextScreen(context, ViewJobQuote(index: widget.index));
                    },textColor: Colors.black,title: "View Quote"),
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
