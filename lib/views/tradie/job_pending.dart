import 'package:fixezi/views/tradie/profile_bottom/profile_bottom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../constants.dart';
import '../../provider/signup_provider.dart';
import '../../provider/tradie_jobs.dart';
import '../../utils/urls.dart';
class JobPending extends StatefulWidget {
  @override
  _JobPendingState createState() => _JobPendingState();
}

class _JobPendingState extends State<JobPending> {
  DateFormat dateFormat = DateFormat('yyyy mm dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  String search = '';
  refresh(){
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    pro.fetchJobs(authPro.userId,'4',Urls.fetchJobUrl,4);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          leading: Container(),
          title: Text("Job Pendings"),
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
                                  refresh();
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
                                        // color: Colors.grey
                                    ),
                                    child: Icon(LineIcons.bars,color: Colors.white,size: 38,)),
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
                      height: 80,
                      child: Column(
                        children: [
                          Text("When you have marked a job as"),
                          Text("‘incomplete’",style: TextStyle(color: blueColor),),
                          Text("it is moved to the ‘Jobs Pending’ location.",textAlign: TextAlign.center)
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
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: pro.pendingJobs == null? Center(
            child: CircularProgressIndicator(),
          ):pro.pendingJobs!.isEmpty ? Center(child: Text("No Pending Jobs"),):
          RefreshIndicator(
            onRefresh: ()async{
              return pro.fetchJobs('LreOqa1mDQ','1',Urls.fetchJobUrl,1);
            },
            child: ListView.builder(
              itemCount: pro.pendingJobs!.length,
              itemBuilder: (c,i){
                var d = pro.pendingJobs![i];
                if(search != ''){
                  if(d.jobId!.contains(search)){
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
                  }else{
                    return Container();
                  }
                }else{
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
                }
              },
            ),
          )
      ),
    );
  }
}
