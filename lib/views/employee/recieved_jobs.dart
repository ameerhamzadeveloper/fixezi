import 'package:fixezi/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../constants.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';
import '../tradie/incomming_job_detail.dart';
class EmployeRecievedJobs extends StatefulWidget {
  @override
  _EmployeRecievedJobsState createState() => _EmployeRecievedJobsState();
}

class _EmployeRecievedJobsState extends State<EmployeRecievedJobs> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  fetchIncomming(){
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    pro.fetchEmployeeJobs(authPro.userId,'3',Urls.fetchJobEmployeUrl,3);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Received Jobs"),
        actions: [
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        pro.setAllJobCurrentId(d.jobId!);
                        nextScreen(context, IncommingJobDetails(index: i,isFromEmploye: true,));
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
                },
              )
          ),
        ),
      ),
    );
  }
}
