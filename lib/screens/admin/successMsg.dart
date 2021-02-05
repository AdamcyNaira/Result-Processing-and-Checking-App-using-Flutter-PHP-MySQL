import 'package:result/screens/admin/addMaterial.dart';
import 'package:result/screens/admin/addMultiStudent.dart';
import 'package:result/screens/admin/adminDashboard.dart';
import 'package:result/screens/admin/courseMaterialList.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';


class SuccessMsg extends StatefulWidget {
   SuccessMsg({this.selectedSemester, this.selectedClass});
  final selectedSemester;
  final String selectedClass;

 
  @override
  _SuccessMsgState createState() => _SuccessMsgState();
}

class _SuccessMsgState extends State<SuccessMsg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Center(
                       child: Text(
                  "Students Uploaded Successful",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                       ),
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                            Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => AddCourseMaterial()));
                            },
                          ),
                    ),
                        ),
                      ],
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



class SuccessMsgCourse extends StatefulWidget {
  @override
  _SuccessMsgCourseState createState() => _SuccessMsgCourseState();
}

class _SuccessMsgCourseState extends State<SuccessMsgCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: " ", context: context),
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
            
              SizedBox(height: 10.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                 
                    SizedBox(
                      height: 30,
                    ),
                    
                     CircleAvatar(
                      radius: 70,
                      backgroundColor: Constants.kPrimaryColor.withOpacity(0.6),
                      child: Icon(Icons.check, color: Colors.white, size: 60,),

                    ),
                    SizedBox(height: 30.0,),
                    Center(
                      child: Text(
                  'Success',
                  style: TextStyle(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        fontFamily: 'Quando',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                ),
                    ),

              
                    SizedBox(
                      height: 40,
                    ),
                     Center(
                       child: Text(
                  "Result Uploaded successfully",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Quando',
                    color: Colors.black54,
                    fontWeight: FontWeight.w500
                  ),
                       ),
                     ),
                      SizedBox(
                      height: 30,
                    ),

                      SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Dashboard',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => AdminBottomNav()), (Route<dynamic> route) => false);
                            },
                          ),
                    ),
                        ),
                        SizedBox(width: 0.0,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child:  Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: FlatButton(
                            color: Colors.white,
                            child: Text(
                              'Previous',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Constants.kPrimaryColor.withOpacity(0.6), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(18),
                            textColor: Constants.kPrimaryColor.withOpacity(0.9),
                            onPressed: () {
                             
                            Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => AddMultiStudent()));
                            },
                          ),
                    ),
                        ),
                      ],
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

