import 'package:fixezi/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';
import '../../utils/urls.dart';
class EmployeJobs extends StatefulWidget {
  @override
  _EmployeJobsState createState() => _EmployeJobsState();
}

class _EmployeJobsState extends State<EmployeJobs> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  String search = '';
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        bottom: PreferredSize(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
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
        title: Text("Employee Jobs"),
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
                    height: 80,
                    child: Column(
                      children: [
                        Text("When you have marked a job as"),
                        Text("‘incomplete’",style: TextStyle(color: blueColor),),
                        Text("it is moved to the ‘Jobs Pending’ location.",textAlign: TextAlign.center,)
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
      body: RefreshIndicator(
        onRefresh: ()async{
          return pro.fetchEmployeeJobsTradie(authPro.userId);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: pro.employeJobsTradie == null ? Center(
              child: CircularProgressIndicator(),
            ): pro.employeJobsTradie!.isEmpty ? RefreshIndicator(onRefresh: ()async{
              return pro.fetchEmployeeJobsTradie(authPro.userId);
            },child: Center(child: Text("No Employe Jobs Found"),)):
            RefreshIndicator(
              onRefresh: ()async{
                return pro.fetchEmployeeJobsTradie(authPro.userId);
              },
              child: ListView.builder(
                itemCount: pro.employeJobsTradie!.length,
                itemBuilder: (c,i){
                  var d = pro.employeJobsTradie![i];
                  if(search != ''){
                    if(d.jobId!.contains(search)){
                      return GestureDetector(
                        onLongPress: (){

                          showDialog(context: context, builder: (c){
                            return CupertinoAlertDialog(
                              title: Text("Do you want Unassign this job?"),
                              actions: [
                                CupertinoDialogAction(child: Text("No"),onPressed: ()=> Navigator.pop(context),),
                                CupertinoDialogAction(child: Text("Yes",style: TextStyle(color: Colors.red),),onPressed: (){
                                  pro.unassignJobToEmploye(context,d.jobId!,authPro.userId);
                                  Navigator.pop(context);
                                },),
                              ],
                            );
                          });

                        },
                        onTap: (){
                          // if(d.statusText == "ACCEPTED"){
                          //   pro.setAllJobCurrentId(pro.allJobs![i].jobId!);
                          // nextScreen(context, AllJobDetials(index: i,isFromEmployee: false,));
                          // }
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
                                    Text(d.statusText!,style: GoogleFonts.poppins(color:d.statusText == "QUOTE CANCELED" || d.statusText == "REJECTED" || d.statusText == "CANCELED"? Colors.red: d.statusText == "JOB EXPORTED" || d.statusText == "Order Parts"? Colors.black:Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
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
                                ):Container(),
                                SizedBox(height: 20,),
                                Text("Employee Details",style: TextStyle(color: Colors.black),),
                                ListTile(
                                  title: Text(d.employData![0].name!),
                                  leading: CircleAvatar(child: Text(d.employData![0].name!.substring(0,1).toUpperCase()),),
                                  subtitle: Text("${d.employData![0].email!}\n${d.employData![0].phoneNumber}"),
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
                    return GestureDetector(
                      onLongPress: (){

                        showDialog(context: context, builder: (c){
                          return CupertinoAlertDialog(
                            title: Text("Do you want Unassign this job?"),
                            actions: [
                              CupertinoDialogAction(child: Text("No"),onPressed: ()=> Navigator.pop(context),),
                              CupertinoDialogAction(child: Text("Yes",style: TextStyle(color: Colors.red),),onPressed: (){
                                pro.unassignJobToEmploye(context,d.jobId!,authPro.userId);
                                Navigator.pop(context);
                              },),
                            ],
                          );
                        });

                      },
                      onTap: (){
                        // if(d.statusText == "ACCEPTED"){
                        //   pro.setAllJobCurrentId(pro.allJobs![i].jobId!);
                        // nextScreen(context, AllJobDetials(index: i,isFromEmployee: false,));
                        // }
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
                                  Text(d.statusText!,style: GoogleFonts.poppins(color:d.statusText == "QUOTE CANCELED" || d.statusText == "REJECTED" || d.statusText == "CANCELED"? Colors.red: d.statusText == "JOB EXPORTED" || d.statusText == "Order Parts"? Colors.black:Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
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
                              ):Container(),
                              SizedBox(height: 20,),
                              Text("Employee Details",style: TextStyle(color: Colors.black),),
                              ListTile(
                                title: Text(d.employData![0].name!),
                                leading: CircleAvatar(child: Text(d.employData![0].name!.substring(0,1).toUpperCase()),),
                                subtitle: Text("${d.employData![0].email!}\n${d.employData![0].phoneNumber}"),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            )
        ),
      ),
    );
  }
}