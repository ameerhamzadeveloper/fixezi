import 'package:fixezi/constants.dart';
import 'package:fixezi/utils/urls.dart';
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
class AllJobDetials extends StatefulWidget {
  final int index;
  final bool isFromEmployee;

  const AllJobDetials({Key? key,required this.index,required this.isFromEmployee}) : super(key: key);
  @override
  _AllJobDetialsState createState() => _AllJobDetialsState();
}

class _AllJobDetialsState extends State<AllJobDetials> {
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  DateFormat timeFormat = DateFormat('hh:mm a');
  TextEditingController adminCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    var d = pro.allJobs![widget.index];
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
                        Text("IN PROGRESS",style: GoogleFonts.poppins(color: blueColor,fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
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
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (c){
                          return AlertDialog(
                            title: Text("Admin Note"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: "Type Here"
                              ),
                              controller: adminCont,
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
                                  },
                                  color: aquaColor,
                                  child: Text("Add Note",style: TextStyle(color: Colors.white),),
                                  minWidth: 100,
                                ),
                              ],
                              actionsAlignment: MainAxisAlignment.center,
                          );
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Admin Note  : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          Text("${adminCont.text}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        ],
                      ),
                    ),
                    Text("Click to Add Admin Note",style: TextStyle(color: Colors.black),)
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
                        Text("${ d.address}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Other PH : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
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
                        Text("Email : ",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                        Text("",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
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
                    child: FixeziButton(color: aquaColor,onTap: (){
                      nextScreen(context, StartJobTime());
                    },textColor: Colors.white,title: "Start Job"),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: Colors.white,onTap: (){
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
                    child: FixeziButton(color:const Color(0xffD46FF8),onTap: (){
                      nextScreen(context, AddQuoteJob(index: widget.index,));
                    },textColor: Colors.white,title: "Add Quotes"),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: FixeziButton(color: Colors.lightBlueAccent,onTap: (){
                      showDialog(context: context, builder: (c){
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(""),
                              Text("Job Options"),
                              IconButton(
                                icon: Icon(Icons.info,color: Colors.red,size: 30,),
                                onPressed: (){
                                  showDialog(context: context, builder: (ct){
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      title: Text("Fixezi Note",textAlign: TextAlign.center,),
                                      content: SizedBox(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Text("You can delete any"),
                                            Text("‘Cancelled’",style: TextStyle(color: blueColor),),
                                            Text("Job by pressing down on the job and selecting"),
                                            Text("‘Delete’",style: TextStyle(color: Colors.red),),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        Center(
                                          child: MaterialButton(
                                            height: 30,
                                            color:aquaColor,
                                            onPressed: ()=> Navigator.pop(context),
                                            child: Text("Done",style: TextStyle(color: Colors.white),),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                                },
                              )
                            ],
                          ),
                          content: SizedBox(
                            height: getWidth(context) / 1.1,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap:(){
                                    Navigator.pop(context);
                                    showDialog(
                                        context: context, builder: (c){
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        title: const Text("Fixezi Note",textAlign: TextAlign.center,),
                                        content: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: [
                                              Text("If the Date/Time is not convenient, please select ‘Accept’ to call the client and change the Date/Time as agreed.",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
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
                                              showCupertinoModalPopup(context: context, builder: (c){
                                                return CupertinoActionSheet(
                                                  cancelButton: const CupertinoDialogAction(
                                                    child: Text("Cancel",style: TextStyle(color: Colors.red),),
                                                  ),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                        child: const Text("Call",style: TextStyle(fontSize: 18),),
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                        UrlLauncher.launch("tel://${d.phoneNumber}");
                                                        showDialog(
                                                            context: context, builder: (c){
                                                          return AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(20)
                                                            ),
                                                            title: const Text("Fixezi Note",textAlign: TextAlign.center,),
                                                            content: SizedBox(
                                                              height: 120,
                                                              child: Column(
                                                                children: [
                                                                  Text("Do you need to change the Date/Time?",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
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
                                                                  pro.changeJobDate(context, widget.index,pro.allJobs![widget.index].jobId!);
                                                                },
                                                                color: aquaColor,
                                                                child: Text("Accept",style: TextStyle(color: Colors.white),),
                                                                minWidth: 100,
                                                              ),
                                                            ],
                                                            actionsAlignment: MainAxisAlignment.center,
                                                          );
                                                        });
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                            },
                                            color: aquaColor,
                                            child: Text("Accept",style: TextStyle(color: Colors.white),),
                                            minWidth: 100,
                                          ),
                                        ],
                                        actionsAlignment: MainAxisAlignment.center,
                                      );
                                    });
                                  },
                                  title: Text("Reschedule Job"),
                                ),
                                ListTile(
                                  onTap:(){
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (c){
                                      return AlertDialog(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(""),
                                            Text("Job Incomplete"),
                                            IconButton(
                                              icon: Icon(Icons.info,color: Colors.red,size: 30,),
                                              onPressed: (){
                                                showDialog(context: context, builder: (ct){
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    title: Text("Fixezi Note",textAlign: TextAlign.center,),
                                                    content: SizedBox(
                                                      height: 100,
                                                      child: Column(
                                                        children: [
                                                          Text("You can delete any"),
                                                          Text("‘Cancelled’",style: TextStyle(color: blueColor),),
                                                          Text("Job by pressing down on the job and selecting"),
                                                          Text("‘Delete’",style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      Center(
                                                        child: MaterialButton(
                                                          height: 30,
                                                          color:aquaColor,
                                                          onPressed: ()=> Navigator.pop(context),
                                                          child: Text("Done",style: TextStyle(color: Colors.white),),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        content: SizedBox(
                                          height: getWidth(context) / 1.7,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: (){
                                                  pro.changeJobStatus('1', 'Order Parts');
                                                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => TradieBottom()), (route) => false);
                                                  pro.fetchJobs(authPro.userId, '1', Urls.fetchJobUrl, 1);
                                                  pro.fetchJobs(authPro.userId, '2', Urls.fetchJobUrl, 2);
                                                },
                                                title: Text("Parts on order"),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, AddQuoteJob(index: widget.index));
                                                },
                                                title: Text("Need to Quote",style: TextStyle(color: Color(0xffF828BE)),),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  pro.changeJobStatus('1', 'Need to return');
                                                  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => TradieBottom()), (route) => false);
                                                  pro.fetchJobs(authPro.userId, '1', Urls.fetchJobUrl, 1);
                                                  pro.fetchJobs(authPro.userId, '2', Urls.fetchJobUrl, 2);
                                                },
                                                title: Text("Need to return",style: TextStyle(color: pureBlueColor),),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  MaterialButton(
                                                    color:Colors.red,
                                                    onPressed: ()=> Navigator.pop(context),
                                                    child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  title: Text("Job is Incomplete"),
                                ),
                                ListTile(
                                  onTap:(){
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (c){
                                      return AlertDialog(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(""),
                                            Text("Job Completed/\nAdditional Quote"),
                                            IconButton(
                                              icon: Icon(Icons.info,color: Colors.red,size: 30,),
                                              onPressed: (){
                                                showDialog(context: context, builder: (ct){
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    title: Text("Fixezi Note",textAlign: TextAlign.center,),
                                                    content: SizedBox(
                                                      height: 100,
                                                      child: Column(
                                                        children: [
                                                          Text("You can delete any"),
                                                          Text("‘Cancelled’",style: TextStyle(color: blueColor),),
                                                          Text("Job by pressing down on the job and selecting"),
                                                          Text("‘Delete’",style: TextStyle(color: Colors.red),),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: [
                                                      Center(
                                                        child: MaterialButton(
                                                          height: 30,
                                                          color:aquaColor,
                                                          onPressed: ()=> Navigator.pop(context),
                                                          child: Text("Done",style: TextStyle(color: Colors.white),),
                                                        ),
                                                      )
                                                    ],
                                                  );
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                        content: SizedBox(
                                          height: getWidth(context) / 1.1,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: (){
                                                  nextScreen(context, MakeJobInvoice(method: "Paid with cash",index: widget.index,));
                                                },
                                                title: Text("Paid with cash"),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, MakeJobInvoice(method: "Paid by card",index: widget.index,));
                                                },
                                                title: Text("Paid by card",style: TextStyle(color: Color(0xffF828BE)),),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, MakeJobInvoice(method: "Paid with cheque",index: widget.index,));
                                                },
                                                title: Text("Paid with cheque",style: TextStyle(color: pureBlueColor),),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, MakeJobInvoice(method: "Paid online banking",index: widget.index,));
                                                },
                                                title: Text("Paid online banking",style: TextStyle(color: pureBlueColor),),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, MakeJobInvoice(method: "Arranged payment plan",index: widget.index,));
                                                },
                                                title: Text("Arranged payment plan",style: TextStyle(color: pureBlueColor),),
                                              ),
                                              ListTile(
                                                onTap:(){
                                                  nextScreen(context, MakeJobInvoice(method: "other",index: widget.index,));
                                                },
                                                title: Text("other",style: TextStyle(color: pureBlueColor),),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  MaterialButton(
                                                    color:Colors.red,
                                                    onPressed: ()=> Navigator.pop(context),
                                                    child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 20),),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                  },
                                  title: Text("Job is Complete/Additional Quote"),
                                ),
                                widget.isFromEmployee ? Container():ListTile(
                                  onTap:(){
                                    Navigator.pop(context);
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)
                                      )),
                                        context: context, builder: (c){
                                      return Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          children: [
                                            Text("Choose Employe to Assign Job",style: TextStyle(color: Colors.black),),
                                            Container(
                                              height: getHeight(context) / 2,
                                              child: ListView.separated(
                                                separatorBuilder: (v,i){
                                                  return Divider();
                                                },
                                                shrinkWrap: true,
                                                itemCount: pro.allEmploye!.length,
                                                itemBuilder: (c,i){
                                                  return ListTile(
                                                    onTap: (){
                                                      Navigator.pop(context);
                                                      pro.assignJobToEmploye(i, context);
                                                    },
                                                    leading: CircleAvatar(
                                                      child: Text(pro.allEmploye![i].name!.substring(0,1).toUpperCase()),
                                                    ),
                                                    title: Text(pro.allEmploye![i].name!),
                                                    subtitle: Text(pro.allEmploye![i].phoneNumber!),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                  title: Text("Foward Job to employee"),
                                ),
                                widget.isFromEmployee ? Container():ListTile(
                                  onTap:(){
                                    Navigator.pop(context);
                                    showDialog(context: context, builder: (c){
                                      return AlertDialog(
                                        content: Text("By selecting 'ACCEPT' you enter into a binding aggrement with 'FIXEZI PTY.LTD. you acknowledge that you will take full ownership of this job and their will be 'NO' refunds on any exported job from fixezi. The app of all trades"),
                                        actions: [
                                          MaterialButton(
                                            color:Colors.red,
                                            onPressed: ()=> Navigator.pop(context),
                                            child: Text("CANCEL",style: TextStyle(color: Colors.white),),
                                          ),
                                          SizedBox(height: 20,),
                                          MaterialButton(
                                            color:Colors.green,
                                            onPressed: (){
                                              Navigator.pop(context);
                                              showDialog(context: context, builder: (c){
                                                return AlertDialog(
                                                  content: Text("The 'FIXEZI TEAM' has put togather a great app for you to accept and schedule jobs from start to finish, WE understand tradesman may use another application to schedule jobs, so we would like to provide you with the option to export 'jobs' from the FIXEZI app\n\nif you select 'EXPORT JOB' you agree that you will be removing the job from fixezi and you will have to notify the client after you 'Accept ' this job."),
                                                  actions: [
                                                    InkWell(
                                                      onTap:(){
                                                        pro.changeJobStatus('2', 'JOB EXPORTED');
                                                        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => TradieBottom(index: 1,)), (route) => false);
                                                        pro.fetchJobs(authPro.userId, '1', Urls.fetchJobUrl, 1);
                                                        pro.fetchJobs(authPro.userId, '2', Urls.fetchJobUrl, 2);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width:150,
                                                        decoration:BoxDecoration(
                                                          border: Border.all(),
                                                          color: yellowColor
                                                        ),
                                                        child: Center(
                                                          child: Text("Export Job",style: TextStyle(color: Colors.black),),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                  actionsAlignment: MainAxisAlignment.center,
                                                );
                                              });
                                            },
                                            child: Text("ACCEPT",style: TextStyle(color: Colors.white),),
                                          )
                                        ],
                                        actionsAlignment: MainAxisAlignment.center,
                                      );
                                    });
                                  },
                                  title: Text("Export job to another App/Schedule"),
                                ),
                                ListTile(
                                  onTap:(){
                                    showDialog(
                                        context: context, builder: (c){
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        title: Text("Are you sure you want to cancel this job?",textAlign: TextAlign.center,),
                                        // content: Container(
                                        //   height: 120,
                                        //   child: Column(
                                        //     children: [
                                        //       Text("You do not have a payment plan yet.\nTo see the clients details, please select ‘Accept’ to choose a payment plan.",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
                                        //     ],
                                        //   ),
                                        // ),
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
                                              pro.changeJobStatus('5', 'Canceled');
                                              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c) => TradieBottom(index: 1,)), (route) => false);
                                              pro.fetchJobs(authPro.userId, '1', Urls.fetchJobUrl, 1);
                                              pro.fetchJobs(authPro.userId, '2', Urls.fetchJobUrl, 2);
                                            },
                                            color: aquaColor,
                                            child: Text("Accept",style: TextStyle(color: Colors.white),),
                                            minWidth: 100,
                                          ),
                                        ],
                                        actionsAlignment: MainAxisAlignment.center,
                                      );
                                    });

                                  },
                                  title: Text("Cancel Job",style: TextStyle(color: Colors.red),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MaterialButton(
                                      color:Colors.red,
                                      onPressed: ()=> Navigator.pop(context),
                                      child: Text("Cancel",style: TextStyle(color: Colors.white,fontSize: 20),),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                    },textColor: Colors.white,title: "Job Options"),
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
