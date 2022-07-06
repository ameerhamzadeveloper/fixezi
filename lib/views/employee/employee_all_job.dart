import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../constants.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';
import '../../utils/urls.dart';
import '../tradie/all_job_details.dart';
class EmployeeAllJobs extends StatefulWidget {
  @override
  _EmployeeAllJobsState createState() => _EmployeeAllJobsState();
}

class _EmployeeAllJobsState extends State<EmployeeAllJobs> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("All Jobs"),
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
          return pro.fetchEmployeeJobs(authPro.userId,'2',Urls.fetchJobEmployeUrl,2);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: pro.allJobs == null ? Center(
              child: CircularProgressIndicator(),
            ): pro.allJobs!.isEmpty ? RefreshIndicator(onRefresh: ()async{
              return pro.fetchEmployeeJobs(authPro.userId,'2',Urls.fetchJobEmployeUrl,2);
            },child: Center(child: Text("No All Jobs Found"),)):
            RefreshIndicator(
              onRefresh: ()async{
                return pro.fetchEmployeeJobs(authPro.userId,'2',Urls.fetchJobEmployeUrl,2);
              },
              child: ListView.builder(
                itemCount: pro.allJobs!.length,
                itemBuilder: (c,i){
                  var d = pro.allJobs![i];
                  return GestureDetector(
                    onLongPress: (){
                      if(d.statusText != "ACCEPTED"){
                        showDialog(context: context, builder: (c){
                          return CupertinoAlertDialog(
                            title: Text("Do you want to delete this job Card?"),
                            actions: [
                              CupertinoDialogAction(child: Text("No"),onPressed: ()=> Navigator.pop(context),),
                              CupertinoDialogAction(child: Text("Yes",style: TextStyle(color: Colors.red),),onPressed: (){
                                pro.deleteJob(authPro.userId,d.jobId!);
                                Navigator.pop(context);
                              },),
                            ],
                          );
                        });
                      }
                    },
                    onTap: (){
                      if(d.statusText == "ACCEPTED"){
                        pro.setAllJobCurrentId(pro.allJobs![i].jobId!);
                        nextScreen(context, AllJobDetials(index: i,isFromEmployee: true,));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                Text(d.statusText!,style: GoogleFonts.poppins(color:d.statusText == "QUOTE CANCELED" || d.statusText == "REJECTED" || d.statusText == "CANCELED"? Colors.red: d.statusText == "JOB EXPORTED" ? Colors.black:Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Problem: ${d.tradeName},${d.problemName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date: ${dateFormat.format(DateTime.parse(d.jobDateTime!))}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                Text("Flexible: ${d.isDateFlexible == '0' ? "No":"Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Time: ${d.jobStartTime}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                                Text("Flexible: ${d.isTimeFlexible == '0' ? "No":"Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Admin job note:",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                            d.statusText == "ACCEPTED" ? Center(
                              child: Icon(Icons.keyboard_arrow_down_sharp,size: 40,),
                            ):Container()
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
        ),
      ),
    );
  }
}
