import 'dart:math';

import 'package:fixezi/config/colors.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
class JobInvoicePage extends StatefulWidget {
  final int index;
  final String method;

  const JobInvoicePage({Key? key,required this.index,required this.method}) : super(key: key);
  @override
  _JobInvoicePageState createState() => _JobInvoicePageState();
}

class _JobInvoicePageState extends State<JobInvoicePage> {
  DateFormat format = DateFormat('yyyy-MM-dd');
  String invoioceNo = '';
  @override
  void initState() {
    super.initState();
    invoioceNo = Random().nextInt(100).toString();
  }
  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<SignupProvider>(context);
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Completed Jobs"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage("${Utils.baseImageUrl}${authPro.tradieProfile!.companyImageUrl!}")
                              )
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(authPro.tradieProfile!.businessName!,style: const TextStyle(color: Colors.black),),
                            Text(authPro.tradieProfile!.abn!,style: const TextStyle(color: Colors.black),),
                            Text(authPro.tradieProfile!.businessAddress!,style: const TextStyle(color: Colors.black),),
                            Text("Invoice No : $invoioceNo",style: const TextStyle(color: Colors.black),)
                          ],
                        )
                        // Image.network("${Utils.baseImageUrl}${pro.tradieProfile!.companyImageUrl!}",height: 100,width: 100,fit: BoxFit.fill,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date : ",style: TextStyle(color: Colors.black),),
                        Text(format.format(DateTime.now()).toString(),style: TextStyle(color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Text("Job No : ${pro.allJobs![widget.index].jobId}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Trade Person : ${pro.tradePersons}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Material : ${pro.material}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Solution : ${pro.jobSolution}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Labour : ${pro.labour}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Price : \$${pro.jobPrice}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Inc Gst : \$${pro.incGst}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Subtotal : \$${pro.jobPrice}",style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Gst : \$${pro.incGst}",style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Total : \$${(int.parse(pro.jobPrice )+ int.parse(pro.incGst)).toString()}",style: TextStyle(color: Colors.black,fontSize: 18),),
                        SizedBox(height: 10,),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              pro.isLoading ? Center(child: CupertinoActivityIndicator(),):FixeziButton(title: "Send invoice/Complete job", color: aquaColor, onTap: (){
                pro.completeJob(context, widget.method,'LreOqa1mDQ');
              }, textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
