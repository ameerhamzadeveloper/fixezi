import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/colors.dart';
import '../../../provider/signup_provider.dart';
import '../../../provider/tradie_jobs.dart';
class CreateEmploye extends StatefulWidget {
  @override
  _CreateEmployeState createState() => _CreateEmployeState();
}

class _CreateEmployeState extends State<CreateEmploye> {
  String name = '';
  String phone = '';
  String email = '';
  String password = '';
  GlobalKey<FormState> keye = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Employee ID"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: keye,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // readOnly: true,
                          // onTap: ()=> nextScreen(context, Address()),
                          decoration: const InputDecoration(
                              hintText: "Enter Name",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                          onChanged: (v){
                            name = v;
                          },
                          validator: (v){
                            if(v!.isEmpty){
                              return "Required Field";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // readOnly: true,
                          // onTap: ()=> nextScreen(context, Address()),
                          decoration: const InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                          onChanged: (v){
                            email = v;
                          },
                          validator: (v){
                            if(v!.isEmpty){
                              return "Required Field";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // readOnly: true,
                          // onTap: ()=> nextScreen(context, Address()),
                          decoration: const InputDecoration(
                              hintText: "Phone Number",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                          onChanged: (v){
                            phone = v;
                          },
                          validator: (v){
                            if(v!.isEmpty){
                              return "Required Field";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // readOnly: true,
                          // onTap: ()=> nextScreen(context, Address()),
                          decoration: const InputDecoration(
                              hintText: "Enter Password",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                          onChanged: (v){
                            password = v;
                          },
                          validator: (v){
                            if(v!.isEmpty){
                              return "Required Field";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // readOnly: true,
                          // onTap: ()=> nextScreen(context, Address()),
                          decoration: const InputDecoration(
                              hintText: "Confirm Password",
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                          validator: (v){
                            if(v!.isEmpty){
                              return "Password Must be Match";
                            }else if(v != password){
                              return "Password Must be Match";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FixeziButton(title: "Create Employee Id", color: aquaColor, onTap: (){
                if(keye.currentState!.validate()){
                  pro.addEmploye(authPro.userId, name, email, phone, password,authPro.token);
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
