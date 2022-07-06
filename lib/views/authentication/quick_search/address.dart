import 'package:fixezi/provider/job_search_provider.dart';
import 'package:fixezi/provider/signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
class JobAddress extends StatefulWidget {
  const JobAddress({Key? key}) : super(key: key);

  @override
  _JobAddressState createState() => _JobAddressState();
}

class _JobAddressState extends State<JobAddress> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      Geolocator.requestPermission();
      final pro = Provider.of<SignupProvider>(context,listen: false);
      Geolocator.getCurrentPosition().then((value){
        pro.assignLatLong(value.latitude, value.longitude);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<JobSearchProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          leading: BackButton(
            color: Colors.white,
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
                      pro.setAddress(place!.name);
                      pro.setLatLong(place.geometry!.location!.lat!.toString(), place.geometry!.location!.lng!.toString());
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
