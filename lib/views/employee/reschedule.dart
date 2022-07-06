import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../config/colors.dart';

class EmployeReschedule extends StatefulWidget {
  const EmployeReschedule({Key? key}) : super(key: key);

  @override
  _EmployeRescheduleState createState() => _EmployeRescheduleState();
}

class _EmployeRescheduleState extends State<EmployeReschedule> {
  @override
  void initState() {
    super.initState();
  }
  DateFormat format = DateFormat('yyyy-MM-dd hh:mm');
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("All Jobs"),
        actions: [
          IconButton(
            icon: const Icon(Icons.info,color: Colors.red,size: 30,),
            onPressed: (){
              showDialog(context: context, builder: (ct){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  title: const Text("Fixezi Note",textAlign: TextAlign.center,),
                  content: SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        const Text("You can delete any"),
                        Text("‘Cancelled’",style: TextStyle(color: blueColor),),
                        const Text("Job by pressing down on the job and selecting"),
                        const Text("‘Delete’",style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ),
                  actions: [
                    Center(
                      child: MaterialButton(
                        height: 30,
                        color:aquaColor,
                        onPressed: ()=> Navigator.pop(context),
                        child: const Text("Done",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                );
              });
            },
          )
        ],
      ),
      body: Container(
        child: EventCalendar(
          emptyText: "No Job for this Date",
          emptyTextColor: Colors.black,
          headerMonthStringType: HeaderMonthStringTypes.Full,
          headerWeekDayStringType: HeaderWeekDayStringTypes.Short,
          dayEventCountViewType: DayEventCountViewType.LABEL,
          dayEventCountTextColor: Colors.black,
          dayEventCountColor: Colors.green,
          calendarType: CalendarType.Gregorian,// dayIndexSelectedBackgroundColor: Colors.black,
          calendarLanguage: 'en',
          viewType: CalendarViewType.Monthly,
          canSelectViewType: true,
          events:pro.allJobs!.map((e){
            print(format.format(DateTime.parse(e.jobDateTime!)).toString());
            if(e.statusText == "ACCEPTED"){
              return Event(
                title: 'Job Id ${e.jobId}',
                description:
                "${e.problemName}, ${e.tradeName}",
                dateTime: format.format(DateTime.parse(e.jobDateTime!)).toString(),
              );
            }else{
               return Event(
                title: 'No Job for this Date',
                description:
                "",
                dateTime: '3432',
              );;
            }

          }).toList()
        ),
      ),
    );
  }
}
