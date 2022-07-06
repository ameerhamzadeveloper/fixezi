import 'package:fixezi/config/colors.dart';
import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class TimeFlexibilityPage extends StatefulWidget {
  @override
  _TimeFlexibilityPageState createState() => _TimeFlexibilityPageState();
}

class _TimeFlexibilityPageState extends State<TimeFlexibilityPage> {
  List<String> timeFlexibility = [
    'Flexible up to 2 hours',
    'Flexible up to 2-4 hours',
    "I'm Free All Day",
    "I'm Free All Week",
  ];
  String selectedVal = '';
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Flexibility"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text("Select Time Flexibility",style: GoogleFonts.poppins(fontSize: 22),),
            SizedBox(height: 10,),
            Container(
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      hint: Text("Time Flexibility",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      value: selectedVal == '' ? null : selectedVal,
                      enableFeedback: true,
                      disabledHint: Text("Select Problem",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      items: timeFlexibility.map((e){
                        return DropdownMenuItem(child: Text(e),value: e,onTap: (){
                        },);
                      }).toList(), onChanged: (c){
                        setState(() {
                          selectedVal = c.toString();
                        });
                    },
                    )),
              ),
            ),
            SizedBox(height: 30,),
            FixeziButton(title: "Done", color: aquaColor, onTap: (){
              pro.setTimeFlexibility(selectedVal);
              Navigator.pop(context);
            }, textColor: Colors.white)
          ],
        ),
      ),
    );
  }
}
