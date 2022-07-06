import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/tradie/credit_card_pages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../config/colors.dart';
class ChoosedPlanPage extends StatefulWidget {
  @override
  _ChoosedPlanPageState createState() => _ChoosedPlanPageState();
}

class _ChoosedPlanPageState extends State<ChoosedPlanPage> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Plan Choosed"),
      ),
      body: pro.currentPlan == null ? Center(child: CircularProgressIndicator(),):Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You are on a ${pro.currentPlan!.planName} .Please select ‘Accept’ to see the clients details.",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: ()=> Navigator.pop(context),
                  color: Colors.red,
                  child: Text("Cancel",style: TextStyle(color: Colors.white),),
                  minWidth: 100,
                ),
                SizedBox(width: 20,),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  onPressed: (){
                    // Navigator.pop(context);
                    if(pro.currentPlan!.isPayed == '0'){
                    showDialog(
                        context: context, builder: (c){
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        title: Text("Fixezi Note",textAlign: TextAlign.center,),
                        content: Container(
                          height: 130,
                          child: Column(
                            children: [
                              Text("A payment of \$9.95 will be deducted from your Account. Please select ‘Accept’ to continue.",textAlign: TextAlign.center,style: GoogleFonts.poppins(),),
                              SizedBox(height: 10,),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all()
                                ),
                                padding: const EdgeInsets.only(left:8),
                                child: Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter Promo Code"
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        actions: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            onPressed: ()=> Navigator.pop(context),
                            color: Colors.red,
                            child: Text("Cancel",style: TextStyle(color: Colors.white),),
                            minWidth: 100,
                          ),
                          SizedBox(width: 20,),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            onPressed: (){
                              nextScreen(context, CreditCardPages());
                            },
                            color: aquaColor,
                            child: Text("Accept",style: TextStyle(color: Colors.white),),
                            minWidth: 100,
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                      );
                    });
                    }else{
                      pro.acceptJob(authPro.userId,context);
                    }
                  },
                  color: aquaColor,
                  child: Text("Accept",style: TextStyle(color: Colors.white),),
                  minWidth: 100,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
