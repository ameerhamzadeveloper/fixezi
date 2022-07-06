import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/colors.dart';
import '../../../provider/signup_provider.dart';

class TradieSettings extends StatefulWidget {
  @override
  _TradieSettingsState createState() => _TradieSettingsState();
}

class _TradieSettingsState extends State<TradieSettings> {
  bool isAccountOnHold = false;
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        // leading: Container(),
        title: Text("Settings"),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: (){
                  showDialog(context: context, builder: (c){
                    return AlertDialog(
                      title: Text("Do you want to Remove Your Account?"),
                      actions: [
                        MaterialButton(
                          onPressed: ()=> Navigator.pop(context),
                          color: Colors.red,
                          child: Text("Cancel",style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(width: 10,),
                        MaterialButton(
                          onPressed: (){
                            pro.changeAccountStatus(authPro.userId, authPro.token, '1', context);
                          },
                          color: aquaColor,
                          child: Text("Remove Account",style: TextStyle(color: Colors.white),),
                        )
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    );
                  });
                },
                leading: Icon(LineIcons.userMinus,color: Colors.red,),
                title: Text("Remove Account",style: TextStyle(color: Colors.red),),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  Share.share("This is Fixezi");
                },
                leading: Icon(LineIcons.share,),
                title: Text("Share"),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){},
                leading: Icon(LineIcons.tags),
                title: Text("Coupon And Referal",),
              ),
            ),
            Card(
              child: pro.isLoading ? SizedBox(
                height: 50,
                  child: Center(child: CupertinoActivityIndicator(),)):ListTile(
                onTap: (){},
                leading: Icon(LineIcons.ban),
                title: Text("Put Account on Hold",),
                trailing: Switch(
                  value: pro.isAccountHold,
                  onChanged: (v){
                    if(!pro.isAccountHold){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to Hold Your Account?"),
                          actions: [
                            MaterialButton(
                              onPressed: ()=> Navigator.pop(context),
                              color: Colors.red,
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(width: 10,),
                            MaterialButton(
                              onPressed: (){
                                pro.changeAccountStatus(authPro.userId, authPro.token, '2', context);
                                Navigator.pop(context);
                              },
                              color: aquaColor,
                              child: Text("Hold Account",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    }else{
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Do you want to Active Your Account?"),
                          actions: [
                            MaterialButton(
                              onPressed: ()=> Navigator.pop(context),
                              color: Colors.red,
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            ),
                            SizedBox(width: 10,),
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                                pro.changeAccountStatus(authPro.userId, authPro.token, '0', context);
                              },
                              color: aquaColor,
                              child: Text("Active Account",style: TextStyle(color: Colors.white),),
                            )
                          ],
                          actionsAlignment: MainAxisAlignment.center,
                        );
                      });
                    }
                  },
                ),
              ),
            ),
            Card(
              child: ListTile(
                onTap: (){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("Are you sure you want logout?"),
                      actions: [
                        MaterialButton(
                          onPressed: ()=> Navigator.pop(context),
                          color: Colors.red,
                          child: Text("No",style: TextStyle(color: Colors.white),),
                        ),
                        SizedBox(width: 10,),
                        MaterialButton(
                          onPressed: (){
                            authPro.clearSharedData();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen()), (route) => false);
                          },
                          color: aquaColor,
                          child: Text("Yes",style: TextStyle(color: Colors.white),),
                        )
                      ],
                      actionsAlignment: MainAxisAlignment.center,
                    );
                  });
                },
                leading: Icon(LineIcons.alternateSignOut,),
                title: Text("Logout",),
              ),
            )
          ],
        ),
      ),
    );
  }
}