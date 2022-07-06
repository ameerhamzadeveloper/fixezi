import 'package:flutter/material.dart';
class OurStory extends StatefulWidget {
  const OurStory({Key? key}) : super(key: key);
  @override
  _OurStoryState createState() => _OurStoryState();
}

class _OurStoryState extends State<OurStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          leading: const BackButton(),
          title: const Text("Our Story",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text("Whilst working as a tradesman and conversing with clients one on one over the many years I came across many conflictions and problems both tradesmen and client faced, issues that seemed to sit in my mind over the years, that in turn developed into an idea of how to help the everyday house/business/property owner/tradesmen work harmoniously while also helping the building and maintenance economy It started as a simple idea, but through dedication, problem solving, and design we soon realized to turn this idea of ours into an App would take some serious dedication, passion and vision.\n\n Two years in the making, little did we know it but creating a working Application out of words, arrows and numbered sequences jotted down on alarge whiteboard was a little daunting and we still didn't have a name.\n\nA name that was describing, an adjective or a playon words (was the thought process), a process that had us checking over 1000's of names for weeks.\n\nThe list of names had to be checked, double checked and triple checked to make sure they were available.\n\n'Fixezi-The App of All Trades' was born, a trade based advertising application for smart phones and website that can be used by every house/property owner, business or realtor or even another tradesmen looking for qualified, reliable, quality tradesmen.",style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
