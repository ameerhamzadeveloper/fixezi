import 'package:fixezi/views/user/job_request_details.dart';
import 'package:fixezi/views/user/previous_history.dart';
import 'package:fixezi/views/user/settings.dart';
import 'package:fixezi/views/user/your_invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../config/assets_config.dart';
import '../../config/colors.dart';
import '../../constants.dart';
import '../../provider/signup_provider.dart';
import '../../provider/user_job_provider.dart';
import '../splash.dart';
import '../tradie/all_job_details.dart';
class JobRequestUser extends StatefulWidget {
  @override
  _JobRequestUserState createState() => _JobRequestUserState();
}

class _JobRequestUserState extends State<JobRequestUser> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserJobProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            // SizedBox(height: 40,),
            Container(
              width: double.infinity,
              color: greyBgColor,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: btnLightBlueColor,
                      //     spreadRadius: 2,
                      //     blurRadius: 6,
                      //     offset: Offset(0, 4),
                      //   ),
                      // ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(AssetsConfig.logo)
                        )
                    ),
                  ),
                  Text("Fixezi",style: GoogleFonts.poppins(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("The App Of All Trades",style: GoogleFonts.poppins(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            ListTile(
              onTap: ()=>Navigator.pop(context),
              leading: Icon(LineIcons.user),
              title: Text("Your Info",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserYourInvoice()),
              leading: Icon(LineIcons.fileInvoice),
              title: Text("Your Invoice",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, UserPreviousHistory()),
              leading: Icon(LineIcons.history),
              title: Text("Previous History",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Share.share("This is Fixezi");
              },
              leading: Icon(LineIcons.share),
              title: Text("Share",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: ()=>nextScreen(context, USerSettings()),
              leading: Icon(LineIcons.cog),
              title: Text("Settings",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
            ListTile(
              onTap: (){
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Are you sure to logout?"),
                    actions: [
                      TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel")),
                      TextButton(onPressed: (){
                        authPro.clearSharedData();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                      }, child: Text("Logout",style: TextStyle(color: Colors.red),)),
                    ],
                  );
                });
              },
              leading: Icon(LineIcons.alternateSignOut),
              title: Text("Logout",style: GoogleFonts.poppins(color: Colors.black),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            Divider(),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100) ,
        child: AppBar(
          bottom: PreferredSize(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Row(
                        //   children: [
                        //     IconButton(
                        //         onPressed: (){
                        //           // fetchIncomming();
                        //         },
                        //         icon:Icon(Icons.refresh,color: Colors.white,))
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              InkWell(
                                // onTap: ()=> nextScreen(context, TradieProfileBottom()),
                                child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // color: Colors.grey
                                    ),
                                    child: Icon(LineIcons.envelope,color: Colors.white,size: 38,)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(kToolbarHeight)),
          title: Text("Job Request"),
          actions: [
            IconButton(onPressed: (){
              pro.fetchJobs(authPro.userId,'2',2);
            }, icon: Icon(Icons.refresh))
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          return pro.fetchJobs(authPro.userId,'2',2);
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: pro.userJobRequestJobs == null ? Center(
              child: CircularProgressIndicator(),
            ): pro.userJobRequestJobs!.isEmpty ? RefreshIndicator(onRefresh: ()async{
              return pro.fetchJobs(authPro.userId,'2',2);
            },child: Center(child: Text("No Pending Jobs Found"),)):
            RefreshIndicator(
              onRefresh: ()async{
                return pro.fetchJobs(authPro.userId,'2',2);
              },
              child: ListView.builder(
                itemCount: pro.userJobRequestJobs!.length,
                itemBuilder: (c,i){
                  var d = pro.userJobRequestJobs![i];
                  return GestureDetector(
                    onLongPress: (){
                      if(d.statusText != "ACCEPTED"){
                        showDialog(context: context, builder: (c){
                          return CupertinoAlertDialog(
                            title: Text("Do you want to delete this job Card?"),
                            actions: [
                              CupertinoDialogAction(child: Text("No"),onPressed: ()=> Navigator.pop(context),),
                              CupertinoDialogAction(child: Text("Yes",style: TextStyle(color: Colors.red),)),
                            ],
                          );
                        });
                      }
                    },
                    onTap: (){
                      if(d.statusText == "ACCEPTED"){
                        pro.setCurrentJobRequestId(pro.userJobRequestJobs![i].jobId!);
                        nextScreen(context, JobRequestDetials(index: i,));
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
                                Text(d.statusText!,style: GoogleFonts.poppins(color:d.statusText == "QUOTE CANCELED" || d.statusText == "CANCELED" || d.statusText == "REJECTED"?Colors.red: Colors.green,fontSize: 18,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            d.statusText == "QUOTE CANCELED" ? Container(
                              width: double.infinity,
                              color: Colors.red,
                              child: Center(child: Text("Quote Canceled By Client")),
                            ):Container(),
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
      ),
    );
  }
}
