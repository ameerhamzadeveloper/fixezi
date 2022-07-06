import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      final pro = Provider.of<SignupProvider>(context,listen: false);
      Geolocator.getCurrentPosition().then((value){
        pro.assignLatLong(value.latitude, value.longitude);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<SignupProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
          title: Text("Choose Address"),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Place",
                        suffixIcon: Icon(Icons.search)
                    ),
                    onChanged: (v){
                      pro.searchPlaceWithName(v);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              pro.placesSearched == null ? Container():
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pro.placesSearched!.results!.length,
                    itemBuilder: (c,i){
                      var place = pro.placesSearched!.results?[i];
                      return ListTile(
                        onTap: (){
                          pro.assignValues(5, place!.name!);
                          pro.assignLatLong(place.geometry!.location!.lat!, place.geometry!.location!.lng!);
                          Navigator.pop(context);
                        },
                        title: Text(place!.name!,style: TextStyle(color: Colors.white),),
                      );
                    },
                  )
            ],
          ),
        ),
      ),
    );
  }
}
