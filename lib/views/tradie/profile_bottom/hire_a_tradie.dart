import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/colors.dart';

class HireATradie extends StatefulWidget {
  @override
  _HireATradieState createState() => _HireATradieState();
}

class _HireATradieState extends State<HireATradie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Hire A Tradie"),
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              padding: const EdgeInsets.all(10),
              child: Text("Ever need a Tradie while your on a job? or you just remembered you need one for your own property? Well now you can easily, by selecting one of the trusted tradies like yourself.",style: GoogleFonts.poppins(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
            ),
            SizedBox(height: 20,),
            FixeziButton(title: "Hire A Tradie as company", color: aquaColor, onTap: (){}, textColor: Colors.white),
            SizedBox(height: 10,),
            FixeziButton(title: "Hire A Tradie as personal", color: blueColor, onTap: (){}, textColor: Colors.white),
          ],
        ),
      ),
    );
  }
}