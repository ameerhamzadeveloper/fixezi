import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/tradie/all_jobs.dart';
import 'package:fixezi/views/tradie/employe_job.dart';
import 'package:fixezi/views/tradie/incomming_jobs.dart';
import 'package:fixezi/views/tradie/job_pending.dart';
import 'package:fixezi/views/tradie/profile_bottom/company_info.dart';
import 'package:fixezi/views/tradie/profile_bottom/create_new.dart';
import 'package:fixezi/views/tradie/profile_bottom/hire_a_tradie.dart';
import 'package:fixezi/views/tradie/profile_bottom/payment_plan.dart';
import 'package:fixezi/views/tradie/profile_bottom/settings.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../provider/signup_provider.dart';
class TradieProfileBottom extends StatefulWidget {
  @override
  _TradieProfileBottomState createState() => _TradieProfileBottomState();
}

class _TradieProfileBottomState extends State<TradieProfileBottom> {
  int _currentIndex = 0;

  List<Widget> allScreens = [
    PaymentPlan(isFromBottom: true,),
    CreateNew(),
    CompanyInfo(),
    HireATradie(),
    TradieSettings()
  ];

  @override
  void initState() {
    super.initState();
    final authPro = Provider.of<SignupProvider>(context,listen:false);
    final pro = Provider.of<TradieJobsProvider>(context,listen:false);
    authPro.fetchTradieProfile();
    pro.fetchEmploye(authPro.userId, authPro.token);
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
                    Icon(LineIcons.creditCard,color:_currentIndex == 0 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Payment\nPlan",style: TextStyle(color:_currentIndex == 0 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                    Icon(LineIcons.plusCircle,color:_currentIndex == 1 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Create\nNew",style: TextStyle(color:_currentIndex == 1 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                    Icon(LineIcons.mobilePhone,color:_currentIndex == 2 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Company\nInfo",style: TextStyle(color:_currentIndex == 2 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                    Icon(LineIcons.userFriends,color:_currentIndex == 3 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Hire\nA Tradie",style: TextStyle(color:_currentIndex == 3 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
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
                    Icon(LineIcons.cog,color:_currentIndex == 4 ? Colors.blue: Colors.grey,size: 30,),
                    SizedBox(height: 10,),
                    Text("Settings",style: TextStyle(color:_currentIndex == 4 ? Colors.blue: Colors.grey),textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
