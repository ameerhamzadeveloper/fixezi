import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/employee/completed_job.dart';
import 'package:fixezi/views/employee/employee_all_job.dart';
import 'package:fixezi/views/employee/job_pending.dart';
import 'package:fixezi/views/employee/recieved_jobs.dart';
import 'package:fixezi/views/employee/reschedule.dart';
import 'package:fixezi/views/tradie/all_jobs.dart';
import 'package:fixezi/views/tradie/employe_job.dart';
import 'package:fixezi/views/tradie/incomming_jobs.dart';
import 'package:fixezi/views/tradie/job_pending.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class EmployeeBottom extends StatefulWidget {
  final int? index;

  const EmployeeBottom({Key? key,this.index}) : super(key: key);

  @override
  _EmployeeBottomState createState() => _EmployeeBottomState();
}

class _EmployeeBottomState extends State<EmployeeBottom> {
  int _currentIndex = 0;

  List<Widget> allScreens = [
    EmployeePendingJob(),
    EmployeeAllJobs(),
    EmployeRecievedJobs(),
    EmployeeCompletedJobs(),
    EmployeReschedule(),
  ];

  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      setState(() {
        _currentIndex = widget.index!;
      });
    }
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    Future.delayed(Duration(milliseconds: 500),(){
      pro.fetchJobsRequest(authPro.userId);
      // authPro.fetchTradieProfile();
      print("fetching job start");
      pro.fetchEmployeeJobs(authPro.userId,'1',Urls.fetchJobEmployeUrl,1);
      pro.fetchEmployeeJobs(authPro.userId,'2',Urls.fetchJobEmployeUrl,2);
      pro.fetchEmployeeJobs(authPro.userId,'4',Urls.fetchJobEmployeUrl,4);
      pro.fetchEmployeeJobs(authPro.userId,'3',Urls.fetchJobEmployeUrl,3);
      // pro.fetchEmploye(authPro.userId, authPro.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: allScreens,
        ),
        bottomNavigationBar: Container(
          height: 100,
          color: Colors.white,
          padding: const EdgeInsets.all(8) ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                child: Column(
                  children: [
                    Icon(LineIcons.infoCircle,color:_currentIndex == 0 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Jobs\npendings",style: TextStyle(color:_currentIndex == 0 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  _currentIndex = 1;
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(LineIcons.tools,color:_currentIndex == 1 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("All\njobs",style: TextStyle(color:_currentIndex == 1 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  _currentIndex = 2;
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(LineIcons.arrowCircleDown,color:_currentIndex == 2 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Received\njobs",style: TextStyle(color:_currentIndex == 2 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  _currentIndex = 3;
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(LineIcons.clipboardWithCheck,color:_currentIndex == 3 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Jobs\nCompleted",style: TextStyle(color:_currentIndex == 3 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  _currentIndex = 4;
                  setState(() {});
                },
                child: Column(
                  children: [
                    Icon(LineIcons.userFriends,color:_currentIndex == 4 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Schedule",style: TextStyle(color:_currentIndex == 4 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
