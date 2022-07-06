import 'package:fixezi/config/colors.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:provider/provider.dart';

import '../../provider/tradie_jobs.dart';
import '../components/fixezi_button.dart';
class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNo = '';
  String cardName = '';
  String expDate = '';
  String cvc = '';
  bool showbackview = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    final authPro = Provider.of<SignupProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Card"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CreditCardWidget(
              isChipVisible: true,
              isHolderNameVisible: true,
              labelCardHolder: cardName,
              showBackView: showbackview,
              cardHolderName: cardName,
              cardNumber: cardNo,
              expiryDate: expDate,
              cvvCode: cvc,
              key: key,
              // glassmorphismConfig: Glassmorphism(
              //   blurX: 10.0,
              //   blurY: 10.0,
              //   gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: <Color>[
              //       Colors.green,
              //       aquaColor,
              //     ],
              //     stops: const <double>[
              //       0.3,
              //       0,
              //     ],
              //   ),
              // ),
              onCreditCardWidgetChange: (CreditCardBrand ) {

            },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  formKey: key1,
                  cardNumber: cardNo,
                  cardHolderName: cardName,
                  expiryDate: expDate,
                  cvvCode: cvc,
                  // formKey: formKey, // Required
                  onCreditCardModelChange: (CreditCardModel data) {
                    if(data.cvvCode != cvc){
                      setState(() {
                        showbackview = true;
                      });
                    }else{
                      setState(() {
                        showbackview = false;
                      });
                    }
                    setState(() {
                      expDate = data.expiryDate;
                      cardNo = data.cardNumber;
                      cardName = data.cardHolderName;
                      cvc = data.cvvCode;
                    });
                  }, // Required
                  themeColor: Colors.red,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: FixeziButton(title: "Add Card", color: aquaColor, onTap: (){
                pro.addCard({
                  'userId': authPro.userId,
                  'cardHolderName':cardName ,
                  'cardNumber': cardNo,
                  'cvc': cvc,
                  'expiryDate': expDate,
                  'userTypeId':'2'
                },authPro.token);
                Navigator.pop(context);
                // nextScreen(context, AddCard());
              }, textColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
