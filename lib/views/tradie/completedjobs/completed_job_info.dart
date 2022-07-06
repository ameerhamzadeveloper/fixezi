import 'package:fixezi/constants.dart';
import 'package:fixezi/views/tradie/completedjobs/view_job_invoice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../config/colors.dart';
import '../../../provider/tradie_jobs.dart';
import '../../components/fixezi_button.dart';
import '../../components/rating_component.dart';
class ComplatedJobInfo extends StatefulWidget {
  final int index;

  const ComplatedJobInfo({Key? key,required this.index}) : super(key: key);
  @override
  _ComplatedJobInfoState createState() => _ComplatedJobInfoState();
}

class _ComplatedJobInfoState extends State<ComplatedJobInfo> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    var d = pro.completedJobs![widget.index];
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Details"),
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
                        Text("${d.statusText}",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
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
              FixeziButton(color: aquaColor,onTap: (){
                print(pro.completedJobs![widget.index].jobId!);
                pro.fetchJobInvoice(pro.completedJobs![widget.index].jobId!);
                nextScreen(context, ViewJobInvoice(index: widget.index));
              },textColor: Colors.white,title: "View Job Invoice"),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
