import 'package:fixezi/config/colors.dart';
import 'package:fixezi/constants.dart';
import 'package:fixezi/helper/stripe_helper.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:fixezi/provider/tradie_jobs.dart';
import 'package:fixezi/views/components/fixezi_button.dart';
import 'package:fixezi/views/tradie/add_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
class CreditCardPages extends StatefulWidget {
  @override
  _CreditCardPagesState createState() => _CreditCardPagesState();
}

class _CreditCardPagesState extends State<CreditCardPages> {
  int? cardIndex;
  String erro = '';
  @override
  void initState() {

    super.initState();
    final pro = Provider.of<TradieJobsProvider>(context,listen: false);
    final prso = Provider.of<SignupProvider>(context,listen: false);
    prso.setHeader();
    pro.fetchCards(prso.userId,prso.token);
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            pro.cards.isEmpty ? Container(): ListView.builder(
              shrinkWrap: true,
              itemBuilder: (c,i){
                var d =pro.cards[i];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    onTap: (){
                      cardIndex = i;
                      pro.selectCard(i);
                    },
                    leading: Icon(LineIcons.creditCard,size: 50,color: pureBlueColor,),
                    title: Text(d.cardNumber),
                    subtitle: Text(d.cardHolderName),
                    trailing: Icon(Icons.circle,color: d.isSelected ? aquaColor:Colors.grey,)
                  ),
                );
              },
              itemCount: pro.cards.length,
            ),
            SizedBox(height: 20,),
            SizedBox(height: 20,),
            FixeziButton(title: "Add Card", color: Colors.lightBlueAccent, onTap: (){
              nextScreen(context, AddCard());
            }, textColor: Colors.white),
            Spacer(),
            Row(
              children: [
                Text(erro,style: TextStyle(color: Colors.red),),
              ],
            ),
            pro.cards.isEmpty ?Container(): pro.isLoading ? Center(child: CupertinoActivityIndicator(color: Colors.white,),):FixeziButton(title: "Continue", color: aquaColor, onTap: (){
              erro = '';
              setState(() {});
              if(cardIndex == null){
                erro = "Please Choose Card";
                setState(() {});
              }else{
                pro.stripeCharge(authPro.userId, cardIndex!,context);
              }


            }, textColor: Colors.white),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
