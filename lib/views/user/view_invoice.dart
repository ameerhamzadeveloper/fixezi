import 'package:fixezi/provider/user_job_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/signup_provider.dart';
import '../../../provider/tradie_jobs.dart';
import '../../../utils/utils.dart';
class ViewJobInvoiceUser extends StatefulWidget {
  final int index;

  const ViewJobInvoiceUser({Key? key,required this.index}) : super(key: key);

  @override
  _ViewJobInvoiceUserState createState() => _ViewJobInvoiceUserState();
}

class _ViewJobInvoiceUserState extends State<ViewJobInvoiceUser> {
  @override
  Widget build(BuildContext context) {
    final authPro = Provider.of<SignupProvider>(context);
    final pro = Provider.of<UserJobProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Job Invoice"),
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
                                  image: NetworkImage("${Utils.baseImageUrl}${pro.userCompletedJobs![widget.index].tradeMan!.companyImageUrl!}")
                              )
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pro.userCompletedJobs![widget.index].tradeMan!.businessName!,style: TextStyle(color: Colors.black),),
                            Text(pro.userCompletedJobs![widget.index].tradeMan!.abn!,style: TextStyle(color: Colors.black),),
                            Text(pro.userCompletedJobs![widget.index].tradeMan!.businessAddress!,style: TextStyle(color: Colors.black),),
                            Text("Invoice No : 234",style: TextStyle(color: Colors.black),)
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
                        Text(pro.userCompletedJobs![widget.index].addDate!.toString(),style: TextStyle(color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    Text("Job No : ${pro.invoiceModel[widget.index].jobId}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Trade Person : ${pro.invoiceModel[0].tradePerson!}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Material : ${pro.invoiceModel[0].material!}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Solution : ${pro.invoiceModel[0].solution!}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Labour : ${pro.invoiceModel[0].labour!}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Text("Trade Person : ${pro.invoiceModel[0].businessName!}",style: TextStyle(color: Colors.black),),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Subtotal : ${pro.invoiceModel[0].price!}",style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Inc Gst : ${pro.invoiceModel[0].incgst!}",style: TextStyle(color: Colors.black),),
                        SizedBox(height: 10,),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Total : ${int.parse(pro.invoiceModel[0].incgst!) + int.parse(pro.invoiceModel[0].price!)}",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // pro.isLoading ? Center(child: CupertinoActivityIndicator(),):FixeziButton(title: "Send invoice/Complete job", color: aquaColor, onTap: (){
              //   pro.completeJob(context, widget.method,'LreOqa1mDQ');
              // }, textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
