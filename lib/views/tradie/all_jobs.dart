import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/tradie/all_job_details.dart';
import 'package:fixezi/views/tradie/profile_bottom/profile_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_picker_timeline/flutter_date_picker_timeline.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
import '../../provider/signup_provider.dart';
import '../../utils/urls.dart';
class AllJobs extends StatefulWidget {
  @override
  _AllJobsState createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  DateFormat timeFormat = DateFormat('hh:mm a');
  DateTime dateTime = DateTime.now();
  DateFormat format = DateFormat('yyyy-MM-dd hh:mm');
  String search = '';
  bool isCalenderOpen = false;
  refresh(){
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          // leading: IconButton(
          //   onPressed: (){
          //     pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
          //   },
          //   icon: Icon(Icons.refresh),
          // ),
          title: Text("All Jobs"),
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
                    // SizedBox(height: 5,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     MaterialButton(
                    //       color: aquaColor,
                    //       onPressed: (){},
                    //       child: Text("Daily"),
                    //     ),
                    //     MaterialButton(
                    //       color: Colors.white,
                    //       onPressed: (){},
                    //       child: Text("Weekly"),
                    //     ),
                    //     MaterialButton(
                    //       color: Colors.white,
                    //       onPressed: (){},
                    //       child: Text("Monthly"),
                    //     )
                    //   ],
                    // ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: FixeziButton(title: "Calender", color: aquaColor, onTap: (){
                        setState(() {
                          isCalenderOpen = !isCalenderOpen;
                        });
                      }, textColor: Colors.white),
                    ),

                    // FlutterDatePickerTimeline(
                    //   itemHeight: 50,
                    //   selectedItemBackgroundColor: aquaColor,
                    //   selectedItemTextStyle: TextStyle(color: Colors.black),
                    //   unselectedItemTextStyle: TextStyle(color: Colors.black),
                    //   unselectedItemWidth: 50,
                    //   startDate: DateTime(dateTime.year, dateTime.month, dateTime.day),
                    //   endDate: DateTime(dateTime.year, dateTime.month + 1, dateTime.day),
                    //   initialSelectedDate: DateTime(dateTime.year, dateTime.month, dateTime.day),
                    //   onSelectedDateChange: (DateTime? dateTime) {
                    //     // print(dateTime);
                    //     var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
                    //     var inputDate = inputFormat.parse(dateTime.toString());
                    //     var outputFormat = DateFormat('yyyy/MM/dd');
                    //     var en =  outputFormat.format(inputDate);
                    //     print(en);
                    //     // pro.selectedDate = en;
                    //   },
                    // ),
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
                      height: 100,
                      child: Column(
                        children: const [
                          Text("You can delete any"),
                          Text("‘Cancelled’",style: TextStyle(color: Colors.red),),
                          Text("Job by pressing down on the job and selecting",textAlign: TextAlign.center,),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            isCalenderOpen ? Container(
              padding: const EdgeInsets.all(15),
              height: getHeight(context) / 2.2,
              child: EventCalendar(
                  emptyTextColor: Colors.black,
                  headerMonthStringType: HeaderMonthStringTypes.Short,
                  headerWeekDayStringType: HeaderWeekDayStringTypes.Short,
                  // dayEventCountViewType: DayEventCountViewType.LABEL,
                  dayEventCountTextColor: Colors.black,
                  dayEventCountColor: Colors.green,
                  calendarType: CalendarType.Gregorian,// dayIndexSelectedBackgroundColor: Colors.black,
                  calendarLanguage: 'en',
                  viewType: CalendarViewType.Monthly,
                  canSelectViewType: true,
                  // events:pro.allJobs!.map((e){
                  //   print(format.format(DateTime.parse(e.jobDateTime!)).toString());
                  //   if(e.statusText == "ACCEPTED"){
                  //     return Event(
                  //       title: 'Job Id ${e.jobId}',
                  //       description:
                  //       "${e.problemName}, ${e.tradeName}",
                  //       dateTime: format.format(DateTime.parse(e.jobDateTime!)).toString(),
                  //     );
                  //   }else{
                  //     return Event(
                  //       title: 'No Job for this Date',
                  //       description:
                  //       "",
                  //       dateTime: '3432',
                  //     );;
                  //   }
                  //
                  // }).toList()
              ),
            ):Container(),
            RefreshIndicator(
              onRefresh: ()async{
                return pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: pro.allJobs == null ? Center(
                  child: CircularProgressIndicator(),
                ): pro.allJobs!.isEmpty ? RefreshIndicator(onRefresh: ()async{
                  return pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
                },child: Center(child: Text("No All Jobs Found"),)):
                    RefreshIndicator(
                      onRefresh: ()async{
                        return pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pro.allJobs!.length,
                        itemBuilder: (c,i){
                          var d = pro.allJobs![i];
                          if(search != ''){
                            if(d.jobId!.contains(search)){
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
                                    nextScreen(context, AllJobDetials(index: i,isFromEmployee: false,));
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
                                        Text("Problem: ${d.problemName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
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
                            }
                            return Container();
                          }else{
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
                                nextScreen(context, AllJobDetials(index: i,isFromEmployee: false,));
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
                                    Text("Problem: ${d.problemName}",style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.w600),),
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
                          }
                        },
                      ),
                    )
              ),
            ),
          ],
        ),
      ),
    );
  }
}