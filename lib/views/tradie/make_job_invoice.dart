import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/tradie/job_invoice_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MakeJobInvoice extends StatefulWidget {
  final String method;
  final int index;
  const MakeJobInvoice({Key? key,required this.method,required this.index}) : super(key: key);

  @override
  _MakeJobInvoiceState createState() => _MakeJobInvoiceState();
}

class _MakeJobInvoiceState extends State<MakeJobInvoice> {
  GlobalKey<FormState> keye = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Invoice Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: keye,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Solution for Problem",
                    border: InputBorder.none
                  ),
                  validator: (c){
                    if(c!.isEmpty){
                      return "This Field is required";
                    }else{
                      return null;
                    }
                  },
                  onChanged: (v){
                    pro.addValue(1, v);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Material",
                      border: InputBorder.none
                  ),
                  onChanged: (v){
                    pro.addValue(2, v);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Labour",
                      border: InputBorder.none
                  ),
                  onChanged: (v){
                    pro.addValue(3, v);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Trade Persons",
                      border: InputBorder.none
                  ),
                  onChanged: (v){
                    pro.addValue(4, v);
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Price",
                      border: InputBorder.none,
                    prefix: Text("\$")
                  ),
                  onChanged: (v){
                    pro.addValue(5, v);
                  },
                  validator: (c){
                    if(c!.isEmpty){
                      return "Field is Required";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                ),
                padding: const EdgeInsets.only(left:10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Inc Gst",
                      border: InputBorder.none,
                      prefix: Text("\$")
                  ),
                  onChanged: (v){
                    pro.addValue(6, v);
                  },
                  validator: (c){
                    if(c!.isEmpty){
                      return "Field is Required";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(height: 50,),
              FixeziButton(title: "Done", color: aquaColor, onTap: (){
                if(keye.currentState!.validate()){
                  nextScreen(context, JobInvoicePage(index: widget.index,method: widget.method,));
                }
              }, textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
