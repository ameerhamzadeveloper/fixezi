import 'package:fixezi/config/colors.dart';
import 'package:flutter/material.dart';
class FixeziContract extends StatefulWidget {
  const FixeziContract({Key? key}) : super(key: key);
  @override
  _FixeziContractState createState() => _FixeziContractState();
}

class _FixeziContractState extends State<FixeziContract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fixezi Contract"),
      ),
      bottomNavigationBar: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                      focusColor: Colors.white,
                      activeColor: Colors.grey,
                      hoverColor: Colors.white,
                      checkColor: Colors.white,
                      side: BorderSide(color: Color(0xff585858)),
                      value: false, onChanged: (v){
                  }),
                  Text('Yes,I have read the terms and conditions')
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: aquaColor,
              child:Center(child: Text("Continue",style: TextStyle(fontSize: 22),))
            ),
          ],
        ),
      ),
    );
  }
}
