import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class ResutView extends StatefulWidget {
  ResutView({this.selectedSemester, this.regno});
  final selectedSemester;
  final String regno;
  @override
  _ResutViewState createState() => _ResutViewState();
}

class _ResutViewState extends State<ResutView> {


  PDFDocument document;
  bool loading = true; 

  _loadPdf() async {
    document =
        await PDFDocument.fromURL("https://teamcoded.com.ng/my_result.php?regno=${widget.regno}&&semester=${widget.selectedSemester}");
        
         Timer(Duration(seconds: 2), () {
           setState(() {
             loading = false;
           });
                });
  }

  @override
  void initState() {
    _loadPdf();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: singleAppBar(title: " ${widget.selectedSemester} RESULT", context: context),
      body: loading 
      ? Center(
        child: CircularProgressIndicator(),
      ) :
      PDFViewer(
        document: document,
      ),
    );
  }
}
