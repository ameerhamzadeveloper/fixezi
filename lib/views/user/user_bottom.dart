import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/user_job_provider.dart';
import 'package:fixezi/views/authentication/quick_search/quick_search.dart';
import 'package:fixezi/views/tradie/all_jobs.dart';
import 'package:fixezi/views/tradie/employe_job.dart';
import 'package:fixezi/views/tradie/incomming_jobs.dart';
import 'package:fixezi/views/tradie/job_pending.dart';
import 'package:fixezi/views/user/job_completed.dart';
import 'package:fixezi/views/user/job_pending.dart';
import 'package:fixezi/views/user/job_request.dart';
import 'package:fixezi/views/user/your_info.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
class UserBottom extends StatefulWidget {
  @override
  _UserBottomState createState() => _UserBottomState();
}

class _UserBottomState extends State<UserBottom> {
  int _currentIndex = 0;

  List<Widget> allScreens = [
    JobPendingsUser(),
    JobRequestUser(),
    QuickSearch(isFromBottom: true,),
    JobCompletedUser(),
    YourInfoUser()
  ];

  @override
  void initState() {
    super.initState();
    final authPro = Provider.of<SignupProvider>(context,listen: false);
    final pro = Provider.of<UserJobProvider>(context,listen: false);
    authPro.fetchUserProfile();
    pro.fetchJobs(authPro.userId, '1', 1);
    pro.fetchJobs(authPro.userId, '2', 2);
    pro.fetchJobs(authPro.userId, '4', 4);
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
                    Text("Job\nrequests",style: TextStyle(color:_currentIndex == 1 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                    Text("Find A\nTradie",style: TextStyle(color:_currentIndex == 2 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                  setState(() {

                  });
                },
                child: Column(
                  children: [
                    Icon(LineIcons.userFriends,color:_currentIndex == 4 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Your\nProfile",style: TextStyle(color:_currentIndex == 4 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
