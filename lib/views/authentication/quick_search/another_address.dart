import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/views/authentication/quick_search/address.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class AnotherAddressJob extends StatefulWidget {
  @override
  _AnotherAddressJobState createState() => _AnotherAddressJobState();
}

class _AnotherAddressJobState extends State<AnotherAddressJob> {
  String selectedVal = '';
  List<String> dropVals = [
    'Landlord',
    'Real Estate agent',
    'Family member',
    'Friend',
    'Tradesman',
    'Contractor',
    'The Bill payer',
    'Myself',
  ];
  GlobalKey<FormState> keye = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Job For Antoher Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: keye,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Person On Site"
                  ),
                  validator: (c){
                    if(c!.isEmpty){
                      return "Field is Required";
                    }
                  },
                  onChanged: (v){
                    pro.setDiffAddressVals(3, v);
                  },
                ),
              ),
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
                        hint: Text("Relationship to person on site",style: GoogleFonts.poppins(fontSize: 18,color: Colors.black,),),
                        value: selectedVal == '' ? null : selectedVal,
                        enableFeedback: true,
                        disabledHint: Text("Select Problem",style: GoogleFonts.poppins(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        items: dropVals.map((e){
                          return DropdownMenuItem(child: Text(e),value: e,onTap: (){
                          },);
                        }).toList(), onChanged: (c){
                        setState(() {
                          selectedVal = c.toString();
                        });
                          pro.setDiffAddressVals(4, c.toString());
                      },
                      )),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  readOnly: true,
                  onTap: (){
                    nextScreen(context, JobAddress());
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Diffirent Address"
                  ),
                  controller: TextEditingController(text: pro.address),
                  validator: (c){
                    if(c!.isEmpty){
                      return "Field is Required";
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                padding: const EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Other Phone (Optional)"
                  ),
                  onChanged: (v){
                    pro.setDiffAddressVals(1, v);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                padding: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number"
                  ),
                  validator: (c){
                    if(c!.isEmpty){
                      return "Field is Required";
                    }
                  },
                  onChanged: (v){
                    pro.setDiffAddressVals(2, v);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FixeziButton(title: "Done", color: aquaColor, onTap: (){
                if(keye.currentState!.validate()){
                  Navigator.pop(context);
                }
              }, textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
