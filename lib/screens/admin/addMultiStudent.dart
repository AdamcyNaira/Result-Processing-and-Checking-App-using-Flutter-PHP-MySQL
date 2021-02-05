import 'dart:async';
import 'dart:io';

import 'package:result/screens/admin/successMsg.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:gx_file_picker/gx_file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 import 'package:connectivity/connectivity.dart';

class AddMultiStudent extends StatefulWidget {
  AddMultiStudent({this.selectedSemester, this.selectedClass, this.selectedCourse});
  final selectedSemester;
  final String selectedClass;
  final String selectedCourse;
 
  @override
  _AddMultiStudentState createState() => _AddMultiStudentState();
}

class _AddMultiStudentState extends State<AddMultiStudent> {

  File _file;
   var result;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;


   _showSuccessSnackBar(context) {
    final snackbar = new SnackBar(
      content: new Text('Successfully Added',
          style: TextStyle(fontSize: 16.0, color: Colors.greenAccent)),
      onVisible: () {
        Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => SuccessMsg(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester,)));
        });
      },
      backgroundColor: Colors.black87,
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }


  saveStudentFile(filePath, context) async{
      result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
           //_showDialog();

      setState(() {
        isLoading = true;
      });
      isLoading
          ? _showDialog(context)
          : Navigator.of(context, rootNavigator: true).pop('dialog');
      Timer(Duration(seconds: 3), () {});
           _uploadFile(filePath, context);

        }else{
          _showerr(context);
                  }
      
  
  }



  Future getFiles() async {
    File file = await FilePicker.getFile(type: FileType.custom, allowedExtensions: ['csv']); 
    
       setState(() {
        _file = file;
        });
      
   
  }

  void _uploadFile(filePath, context) async{
    String fileName = basename(filePath.path);
    print("File base name: $fileName");

    try {
      FormData formData = new FormData.fromMap({
        "request": "ADD MULTI STUDENT",
        "file" : await MultipartFile.fromFile(filePath.path, filename: fileName),
        
      });

      Response response = await Dio().post("https://teamcoded.com.ng/result.php", data: formData);
         setState(() {
        isLoading = false;
      });

      !isLoading
          ? Navigator.of(context, rootNavigator: true).pop('dialog')
          : _showDialog(context);
      Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => SuccessMsg(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester,)));

      print("File response : ${response.statusCode}");
    } catch (e) {
      print("Exception caught: $e");
    }
  }

  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            children: <Widget>[
              new CircularProgressIndicator(),
              SizedBox(
                width: 25.0,
              ),
              new Text("Uploading Students..."),
            ],
          ),
        );
      },
    );
  }

   void _showerr(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new IconButton(
                onPressed: (){
                  Navigator.of(context, rootNavigator: true).pop('dialog');
                },
                icon: Icon(Icons.cancel, size: 40.0,),
                color: Constants.kPrimaryColor.withOpacity(0.5),
                iconSize: 10,
              ),
              SizedBox(
                width: 25.0,
              ),
              Flexible(child: new Text("No internet connection", style: TextStyle(fontSize: 14),)),
            ],
          ),
        );
      },
    );
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Add Student',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quando',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 30.0,),
              ListView( 
                primary: false,
                shrinkWrap: true,
                children: [
                  SizedBox(
                      height: 10,
                    ),
                     Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                        child: Text(
                          "Choose a file (Excel CSV format only) ",
                          style: TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: FlatButton(
                        highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
                        splashColor:  Constants.kPrimaryColor.withOpacity(0.1),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(FontAwesomeIcons.fileExcel, color: Colors.black54),
                            Text(
                              'Click here to choose a file',
                              style: TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            Icon(Icons.cloud_upload, color: Colors.black54),
                          ],
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color:  Constants.kPrimaryColor.withOpacity(0.3), width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(18),
                        textColor: Colors.white,
                        onPressed: () {
                          getFiles();
                        },
                      ),
                    ),
                    
                    SizedBox(
                      height: 30,
                    ), 
                   
                     Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: FlatButton(
                        color: Constants.kPrimaryColor.withOpacity(0.6),
                        child: Text(
                          'ADD STUDENT',
                          style: TextStyle(fontSize: 14),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(18),
                        textColor: Colors.white,
                        onPressed: () {
                           saveStudentFile(_file,context);
                        },
                      ),
                    ),
                ],
              ),
           ], 
          ),
        ),
      ),
    );
  }
}

