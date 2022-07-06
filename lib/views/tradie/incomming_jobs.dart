import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/tradie/incomming_job_detail.dart';
import 'package:fixezi/views/tradie/profile_bottom/profile_bottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
class IncommingJobs extends StatefulWidget {
  @override
  _IncommingJobsState createState() => _IncommingJobsState();
}

class _IncommingJobsState extends State<IncommingJobs> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
String search = '';
  fetchIncomming(){
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    pro.fetchJobsRequest(authPro.userId);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          leading: Container(),
          title: Text("Incoming Jobs"),
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                fetchIncomming();
                              },
                                icon:Icon(Icons.refresh,color: Colors.white,))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: ()=> nextScreen(context, TradieProfileBottom()),
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // color: Colors.grey
                                    ),
                                    child: Icon(LineIcons.envelope,color: Colors.white,size: 38,)),
                              ),
                              SizedBox(width: 20,),
                              InkWell(
                                onTap: ()=> nextScreen(context, TradieProfileBottom()),
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey
                                    ),
                                    child: Icon(Icons.list,color: Colors.white,)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white)
                        ),
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          toolbarOptions: ToolbarOptions(
                          ),
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onChanged: (v){
                            setState(() {
                              search = v;
                            });
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search Job No",
                            hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(kToolbarHeight)),
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
                      height: 290,
                      child: Column(
                        children: [
                          Text("When you have"),
                          Text("‘Accepted’",style: TextStyle(color: aquaColor),),
                          Text("a job it is moved to the ‘All Jobs’ location. ",textAlign: TextAlign.center,),
                          SizedBox(height: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: yellowColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Text("Emergency Callout(After hours)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                                Text("If you receive a Job that has been booked as a emergency callout(after hours), you will need to ring that client as soon as posible and let them know when you can come out to job, and your fees. ",textAlign: TextAlign.center,)
                              ],
                            ),
                          )
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
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          return fetchIncomming();
        },
        child: RefreshIndicator(
          onRefresh: ()async{
            return fetchIncomming();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:pro.jobRequest == null ? RefreshIndicator(onRefresh: ()async{
              return fetchIncomming();
            },child: Expanded(child: Center(child: Text("No Incomming Jobs"),))): pro.jobRequest!.isEmpty ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ):
                ListView.builder(
                  itemCount: pro.jobRequest!.length,
                  itemBuilder: (ct,i){
                    var d = pro.jobRequest![i];
                    if(search != ''){
                      if(d.jobId!.contains(search)){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              pro.setAllJobCurrentId(d.jobId!);
                              nextScreen(context, IncommingJobDetails(index: i,isFromEmploye: false,));
                            },
                            child: Container(
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
                                  SizedBox(height: 10,),
                                  Text("Problem : ${d.problemName},${d.tradeName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Date : ${dateFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                      Text("Flexible: ${d.isDateFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Time: ${timeFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                      Text("Flexible: ${d.isTimeFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Admin job note:",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                  Center(
                                    child: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }else{
                        return Container();
                      }
                    }else{
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            pro.setAllJobCurrentId(d.jobId!);
                            nextScreen(context, IncommingJobDetails(index: i,isFromEmploye: false,));
                          },
                          child: Container(
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
                                SizedBox(height: 10,),
                                Text("Problem : ${d.problemName},${d.tradeName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date : ${dateFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                    Text("Flexible: ${d.isDateFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Time: ${timeFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                    Text("Flexible: ${d.isTimeFlexible == '0' ? "No" : "Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Text("Admin job note:",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                Center(
                                  child: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  },
                )
          ),
        ),
      ),
    );
  }
}