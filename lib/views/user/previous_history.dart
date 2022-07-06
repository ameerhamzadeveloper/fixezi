import 'package:fixezi/config/colors.dart';
import 'package:fixezi/views/components/rating_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UserPreviousHistory extends StatefulWidget {
  @override
  _UserPreviousHistoryState createState() => _UserPreviousHistoryState();
}

class _UserPreviousHistoryState extends State<UserPreviousHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color:pureBlueColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Previous Tradesman You have rated",textAlign: TextAlign.center,),
                )),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (c,i){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Business Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          Text("You rated them:"),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Punctual",style: GoogleFonts.poppins(color: Colors.white,),),
                              RatingComponents(totalRating: 2),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Workmanship",style: GoogleFonts.poppins(color: Colors.white,),),
                              RatingComponents(totalRating: 2),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Affordability",style: GoogleFonts.poppins(color: Colors.white),),
                              RatingComponents(totalRating: 2),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
