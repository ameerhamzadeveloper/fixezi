import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../provider/tradie_jobs.dart';
import '../../utils/urls.dart';
class EmployeePendingJob extends StatefulWidget {
  @override
  _EmployeePendingJobState createState() => _EmployeePendingJobState();
}

class _EmployeePendingJobState extends State<EmployeePendingJob> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Pending Jobs"),
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
      ),body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: pro.pendingJobs == null? Center(
          child: CircularProgressIndicator(),
        ):pro.pendingJobs!.isEmpty ? Center(child: Text("No Pending Jobs"),):
        RefreshIndicator(
          onRefresh: ()async{
            return pro.fetchEmployeeJobs(authPro.userId,'1',Urls.fetchJobEmployeUrl,1);
          },
          child: ListView.builder(
            itemCount: pro.pendingJobs!.length,
            itemBuilder: (c,i){
              var d = pro.pendingJobs![i];
              return InkWell(
                onTap: (){
                  // pro.setAllJobCurrentId(pro.allJobs[i].jobId!);
                  // nextScreen(context, AllJobDetials(index: i,));
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
                            Text("${d.statusText}",style: GoogleFonts.poppins(color:d.statusText == 'QUOTED'? Colors.pink : Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Problem: ${d.tradeName},${d.problemName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date: ${dateFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                            Text("Flexible: ${d.isDateFlexible == '0' ? "No":"Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Time: ${timeFormat.format(d.addDate!)}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
                            Text("Flexible: ${d.isTimeFlexible == '0' ? "No":"Yes"}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
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
          ),
        )
    ),
    );
  }
}
