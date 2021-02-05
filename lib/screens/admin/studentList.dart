import 'dart:async';
import 'dart:convert';

import 'package:result/screens/admin/addCourse.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List studentData =[];
List studentList = [];
List countStudent = [];



class GetStudentList extends StatefulWidget {
  // GetCourseList({this.selectedSemester, this.selectedClass, this.request});
  // final selectedSemester;
  // final String selectedClass;
  // final String request;
  @override
  _GetStudentListState createState() => _GetStudentListState();
}

class _GetStudentListState extends State<GetStudentList> {


 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

 Future<List> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH ALL STUDENT",

          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentData = convertDateToJson;
      });
      return studentData;
      }


@override
  void initState() {
    fetchStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchStudentData(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
      List myData = (snapshot.data);
        if (myData == null) {
          return Scaffold( 
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                child: spinkit,
              ),
              SizedBox(height: 10,),
                Center(
                  child: Text( 
                    'Loading...'
                  ),
                ),
              ],
            ),
          );
        } else {
          return myData.isNotEmpty 
          ? 
          StudentList() 
          : 
          Scaffold( 
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Container(
                child: Icon(Icons.warning, size: 50, color: Colors.orange[400]),
              ),
              SizedBox(height: 15,),
                Center(
                  child: Text( 
                    'No Registered Student'
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}











class StudentList extends StatefulWidget {
  StudentList({this.selectedSemester, this.selectedClass, this.request});
  final selectedSemester;
  final String selectedClass;
  final String request;
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {

  Future<String> fetchStudentData() async {
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH ALL STUDENT",
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        studentList = convertDateToJson;
      });
      return "Success";
      }



        Future<List> countStudentList() async {

        final response =
            await http.post('https://teamcoded.com.ng/result.php', body: {
          "request": "COUNT STUDENT",
    });

      var convertDataToJson = jsonDecode(response.body);
      setState(() {
        countStudent = convertDataToJson;
      });
      return countStudent;
  }

 


@override
  void initState() {
    fetchStudentData();
    countStudentList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: "", context: context),
      body: Container(
        color: Constants.kPrimaryColor.withOpacity(0.03),
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Registered Students',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quando',
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700),
                  ),
                   CircleAvatar(
                  radius: 20,
                 child: Text( studentList.isNotEmpty 
                ? "${countStudent[0]['count(*)'].toString()}"
                : "0",), 
                )
                ],
              ),
            ),
            ),
            SizedBox(height: 20.0,),
          Expanded(flex: 10,
          child:
           Container(
             height: MediaQuery.of(context).size.height*0.73,
             child: studentList != null ? ListView.builder(
                shrinkWrap: true,
                 itemCount: studentList == null ? 0 : studentList.length,
                itemBuilder: (BuildContext context, int index) {
                   if (studentList != null) {
                      return studentTile(
                    context,
                    studentList[index]['Student_name'],
                    studentList[index]['regno'],
                    studentList[index]['level'],
                    (){
                      //  Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => CourseContent(selectedSemester: widget.selectedSemester, selectedClass: widget.selectedClass, selectedCourse: "Introduction to Java Programming",)));
                    }, 
                      () async{

                             showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm"),
                    content:
                        new Text("Are you sure you want to delete this student?"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new RaisedButton(
                                color: Colors.red,
                                child: Row(
                                  children: <Widget>[
                                    new Text("YES"),
                                    SizedBox(width: 5.0),
                                    Icon(Icons.check_circle),
                                  ],
                                ),
                                onPressed: () async{
                                var id = studentList[index]['student_id'];
                                  await http.post("https://teamcoded.com.ng/result.php", body: {
                                      "request": "DELETE STUDENT",
                                      "id": id,
                                      });
                               fetchStudentData();
                               countStudentList();
                                  Navigator.of(context, rootNavigator: true).pop('dialog');
                                },
                              ),
                              new RaisedButton(
                                color: Colors.blueAccent,
                                child: Row(
                                  children: <Widget>[
                                    new Text("NO"),
                                    SizedBox(width: 5.0),
                                    Icon(Icons.cancel)
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop('dialog');
                                },
                              ),
                            ]),
                      )
                    ],
                  );
                },
              );
                            
                          },
                    
                    fetchStudentData(),
                  );
                   }else{
                     Center(child: CircularProgressIndicator());
                   }
                }
              
              ) :  Center(child: Text('Loading...', style: TextStyle(color: Colors.black),),),
           ),
          ),
   
         ], 
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //       Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => AddCourse(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester,)));
      //   },
      //   child: Icon(Icons.add),
      //   elevation: 4,
      // ),
    );
  }
}

Widget studentTile(context, String name, String regno, String level, Function route, Function route2, fetchStudentData){
  return Column(
    children: [
      GestureDetector(
                      onTap: route,
                      child: Material(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(12)),
                           border: Border(left: BorderSide(width: 5.0, color: Constants.kPrimaryColor.withOpacity(0.6))) 
                          ),
                        width: MediaQuery.of(context).size.width,
                        child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset('img/user-icon.jpg',height: 70, width: 70,),
                                      SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top:8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text(
                                              name,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 11.0,
                                                fontFamily: 'Quando',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                              ),
                                              
                                            ),
                                            
                                            SizedBox( height: 5.0,),
                                            Text(
                                              "Reg No: $regno",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox( height: 5.0,),
                                            Text(
                                              "Level: $level",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.black54,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                   
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  
                          ],
                        ),
                                ),
                        IconButton(
                          icon: Icon(Icons.delete,size: 20, color: Colors.black54,),
                          onPressed: route2
                        )
                              ],
                            ),
                      ),
                      ),
                    ),
                    SizedBox(height: 15,),
    ],
  );
}