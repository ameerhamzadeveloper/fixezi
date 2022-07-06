import 'package:fixezi/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/user_job_provider.dart';
class ViewJobQuote extends StatefulWidget {
  final int index;

  const ViewJobQuote({Key? key,required this.index}) : super(key: key);
  @override
  _ViewJobQuoteState createState() => _ViewJobQuoteState();
}

class _ViewJobQuoteState extends State<ViewJobQuote> {
  DateTime d = DateTime.now();
  DateFormat format = DateFormat('yyyy-MM-dd');

  int daysLeft = 0;

  @override
  void initState() {
    super.initState();
    final pro = Provider.of<UserJobProvider>(context,listen: false);
    int days = int.parse(pro.jobQuote![0].days!);
    var total = days - d.difference(pro.jobQuote![0].dateTime!).inDays;
    daysLeft = total;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<UserJobProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Job Quote"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  pro.jobQuote == null ? Container():Row(
                    children: List.generate(pro.jobQuote![0].images!.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("${Utils.baseImageUrl}${pro.jobQuote![0].images![index].imageUrl}"))
                              )
                          ),
                        );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text("How long will this quote last ?",style: TextStyle(color: Colors.black,fontSize: 18),),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$daysLeft Days Left",style: TextStyle(color: Colors.black),),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius:BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Job no : ${pro.userPendingJobs![widget.index].jobId}",style: const TextStyle(color: Colors.black),),
                      Text("Date : ${format.format(pro.jobQuote![0].dateTime!)}",style: const TextStyle(color: Colors.black),),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text("Quote Description : ${pro.jobQuote![0].jobQuoteDescription!}",style: TextStyle(color: Colors.black),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Price ",style: TextStyle(color: Colors.black),),
                          Text("\$ ${pro.jobQuote![0].price!}",style: TextStyle(color: Colors.black),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Gst ",style: TextStyle(color: Colors.black),),
                          Text("\$ ${pro.jobQuote![0].incgst!}",style: TextStyle(color: Colors.black),),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            // const SizedBox(height: 20,),
            // pro.isLoading ? Center(
            //   child: CircularProgressIndicator(),
            // ):FixeziButton(title: "Save and send Quote to client", color: aquaColor, onTap: (){
            //   pro.addJobQuote(des, price, incGst, is7Selected ? '7':'14', context);
            // }, textColor: Colors.white),
            // const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
