import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/utils/urls.dart';
import 'package:fixezi/views/tradie/all_jobs.dart';
import 'package:fixezi/views/tradie/employe_job.dart';
import 'package:fixezi/views/tradie/incomming_jobs.dart';
import 'package:fixezi/views/tradie/job_pending.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import 'completedjobs/job_completed.dart';

class TradieBottom extends StatefulWidget {
  final int? index;

  const TradieBottom({Key? key,this.index}) : super(key: key);

  @override
  _TradieBottomState createState() => _TradieBottomState();
}

class _TradieBottomState extends State<TradieBottom> {
  int _currentIndex = 0;

  List<Widget> allScreens = [
    JobPending(),
    AllJobs(),
    IncommingJobs(),
    JobCompleted(),
    EmployeJobs()
  ];
  
  @override
  void initState() {
    super.initState();
    print("Init Init");
    if(widget.index != null){
      print("Check index");
      Future.delayed(const Duration(milliseconds: 500),(){
        print("run delya");
        setState(() {
          _currentIndex = widget.index!;
        });
      });
    }
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    Future.delayed(Duration(milliseconds: 500),(){
      pro.fetchJobsRequest(authPro.userId);
      authPro.fetchTradieProfile();
      print("fetching job start");
      pro.fetchJobs(authPro.userId,'1',Urls.fetchJobUrl,1);
      pro.fetchJobs(authPro.userId,'2',Urls.fetchJobUrl,2);
      pro.fetchJobs(authPro.userId,'4',Urls.fetchJobUrl,4);
      pro.fetchEmploye(authPro.userId, authPro.token);
      pro.fetchEmployeeJobsTradie(authPro.userId);
      pro.checkAccountStatus(authPro.userId);
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
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.all(12) ,
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
                  Text("Recieved\njobs",style: TextStyle(color:_currentIndex == 2 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                  Text("Jobs\nDone",style: TextStyle(color:_currentIndex == 3 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                _currentIndex = 4;
                setState(() {

                });
              },
              child: Column(
                children: [
                  Icon(LineIcons.userFriends,color:_currentIndex == 4 ? Colors.blue: Colors.grey,size: 30,),
                  SizedBox(height: 10,),
                  Text("Employee\nJobs",style: TextStyle(color:_currentIndex == 4 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
