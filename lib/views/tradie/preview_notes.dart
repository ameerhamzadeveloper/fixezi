import 'dart:io';

import 'package:fixezi/constants.dart';
import 'package:fixezi/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/tradie_jobs.dart';

class PreviewNotes extends StatefulWidget {
  final int url;

  const PreviewNotes({Key? key,required this.url}) : super(key: key);
  @override
  _PreviewNotesState createState() => _PreviewNotesState();
}

class _PreviewNotesState extends State<PreviewNotes> {
  int pageno = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.url,
      keepPage: true,
    );
    pageno = widget.url;
  }
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TradieJobsProvider>(context);
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: pro.jobNotesImageList.length,
        itemBuilder: (c,i){
          return Container(
            height: getHeight(context),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("${Utils.baseImageUrl}${pro.jobNotesImageList[i].jobNoteImageUrl}")
                )
            ),
          );
        },
      )
    );
  }
}
