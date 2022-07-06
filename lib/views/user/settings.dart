import 'package:flutter/material.dart';
class USerSettings extends StatefulWidget {
  @override
  _USerSettingsState createState() => _USerSettingsState();
}

class _USerSettingsState extends State<USerSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("What do you think of fixezi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("Here at Fixezi we aim to give user the simplest and most user friendly app we could think of. ",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white),),
            Text("So if your are experiencing any problem or have any suggestions, we would love to hear from you",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.white),),
            SizedBox(height: 40,),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.only(left:10),
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Please type your comments here",
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Thank you",style: TextStyle(fontSize: 19),),
                  Text("Your Team at Fixezi",style: TextStyle(fontSize: 19),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
