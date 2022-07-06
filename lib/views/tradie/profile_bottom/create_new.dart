import 'package:fixezi/constants.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/tradie/profile_bottom/create_employe.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../provider/signup_provider.dart';
import '../../../provider/tradie_jobs.dart';

class CreateNew extends StatefulWidget {
  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        // leading: Container(),
        title: Text("Create Employee Id"),
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            pro.allEmploye == null ? Center(child: CircularProgressIndicator(),):pro.allEmploye!.isEmpty ? Center(child: Text("No Employee"),):ListView.builder(
              shrinkWrap: true,
              itemBuilder: (c,i){
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(pro.allEmploye![i].name!.substring(0,1).toUpperCase()),
                    ),
                    title: Text(pro.allEmploye![i].name!),
                    trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){
                      showDialog(context: context, builder: (c){
                        return AlertDialog(
                          title: Text("Do you want to delete ${pro.allEmploye![i].name!}?"),
                          actions: [
                            MaterialButton(
                              onPressed: ()=>Navigator.pop(context),
                              color: Colors.red,
                              child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            ),
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                                pro.deleteEmployeAccount(authPro.userId, authPro.token, pro.allEmploye![i].userId!);
                              },
                              color: aquaColor,
                              child: Text("Delete",style: TextStyle(color: Colors.white),),
                            )
                          ],
                        );
                      });
                    },),
                  ),
                );
              },
              itemCount: pro.allEmploye!.length,
            ),
            Spacer(),
            FixeziButton(title: "Create New Employee", color: aquaColor, onTap: (){
              nextScreen(context, CreateEmploye());
            }, textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}