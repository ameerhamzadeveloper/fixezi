import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:fixezi/views/authentication/login/login_check.dart';
import 'package:fixezi/views/authentication/quick_search/book_tradie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../provider/job_search_provider.dart';
import '../tradi_check.dart';
class SelectTrademan extends StatefulWidget {
  @override
  _SelectTrademanState createState() => _SelectTrademanState();
}

class _SelectTrademanState extends State<SelectTrademan> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Find a tradie"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text("You have selected",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // color: aquaColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(pro.isResidential ? "Residential": "Commercial",style: GoogleFonts.poppins(color: Colors.lightBlue,fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          // color: aquaColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text("${pro.selectTrade}/ ${pro.selectProblem}",style: GoogleFonts.poppins(color: Colors.lightBlue,fontSize: 12,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text("Please Select a company",style: GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  // border: Border.all()
                ),
                child: pro.tradesManList.length == 0 ? Center(child: Text("No Tradie Found",style: TextStyle(color: Colors.black),),):ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (c,i){
                    return Divider();
                  },
                  itemCount: pro.tradesManList.length,
                  itemBuilder: (c,i){
                    var t = pro.tradesManList[i];
                    return ListTile(
                      leading: Container(
                        height: 100,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("${Utils.baseImageUrl}${t.companyImageUrl}")
                          )
                        ),
                      ),
                      title: Text(t.businessName!),
                      subtitle: Text(t.tradingName!),
                      trailing: MaterialButton(
                        child: Text("Select",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          if(authPro.userId == ''){
                            showDialog(context: context, builder: (c){
                              return CupertinoAlertDialog(
                                title: Text("Please Login/Register to Book Tradie"),
                                actions: [
                                  CupertinoDialogAction(child: Text("Login"),onPressed: ()=> nextScreen(context, LoginCheck()),),
                                  CupertinoDialogAction(child: Text("Register"),onPressed: ()=> nextScreen(context, TrediesCheckPage()),),
                                  CupertinoDialogAction(child: Text("Cancel"),onPressed: ()=> Navigator.pop(context),)
                                ],
                              );
                            });
                          }else{
                            nextScreen(context, BookTradie(index: i));
                          }
                        },
                        color: aquaColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
