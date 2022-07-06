import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../provider/job_search_provider.dart';
class JobRequestSent extends StatefulWidget {
  final int index;

  const JobRequestSent({Key? key,required this.index}) : super(key: key);
  @override
  _JobRequestSentState createState() => _JobRequestSentState();
}

class _JobRequestSentState extends State<JobRequestSent> {
  DateFormat format = DateFormat('dd MMM yyyy');
  var textbgColor = aquaColor;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Request Sent"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  // border: Border.all(color: Colors.white)
                ),
                padding: const EdgeInsets.all(10),
                child: Text("Please wait while the tradesman recieves your job request, we will get back to you shortly.",style: GoogleFonts.poppins(),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.yellow.shade400,
                    // border: Border.all(color: Colors.white)
                ),
                padding: const EdgeInsets.all(10),
                child: Text("Please wait while the tradesman recieves your job request, we will get back to you shortly.",style: GoogleFonts.poppins(color: Colors.black),textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.white)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Problem : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Expanded(child: Text("${pro.selectTrade},${pro.selectProblem}",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Date : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                                  Text(format.format(pro.date).toString(),style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Flexible : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                                  Text(pro.isDateFlexible ? "Yes" :"No",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Time : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                                  Text(pro.time.format(context).toString(),style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Flexible : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                                  Text(pro.isTimeFlexible ? "Yes":"No",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Time Flexibility : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.timeFlexibility,style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Person On Site : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.personOnSite,style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Job Address : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("User Address",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Mobile Number : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("User Mobile Phone",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Other Phone : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("Other Phone",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Job Request : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("Sent",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bill Payer",style: GoogleFonts.poppins(fontSize: 18,color: Colors.red),textAlign: TextAlign.center,),
                            ],
                          ),
                          Row(
                            children: [
                              Text(pro.tradesManList[widget.index].businessOwnerName!,style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Address : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.tradesManList[widget.index].businessAddress!,style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Will be bill payer be on site : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.personOnSite == "" ? "Me": pro.personOnSite,style: GoogleFonts.poppins(fontSize: 18,color: aquaColor),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Relationship : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.relationToPerson == "" ? "Myself": pro.relationToPerson,style: GoogleFonts.poppins(fontSize: 18,color: Colors.red),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Other Phone : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text(pro.otherPHone,style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Mobile Number : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("User Mobile",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text("Email : ",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),),
                              Text("userEMail",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black),)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
