import 'dart:async';
import 'dart:convert';

import 'package:result/screens/student/resultView.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List courseData =[];
List countCourse = [];

var  regno ;



class GetResultList extends StatefulWidget {
  GetResultList({this.selectedSemester, this.selectedClass, this.request});
  final selectedSemester;
  final String selectedClass;
  final String request;
  @override
  _GetResultListState createState() => _GetResultListState();
}

class _GetResultListState extends State<GetResultList> {


//   Future<void> _deleteCacheDir() async {
//   final cacheDir = await getTemporaryDirectory();

//   if (cacheDir.existsSync()) {
//     cacheDir.deleteSync(recursive: true);
//   }
// }

// Future<void> _deleteAppDir() async {
//   final appDir = await getApplicationSupportDirectory();

//   if (appDir.existsSync()) {
//     appDir.deleteSync(recursive: true);
//   }
// }

 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

 getData() {
      setState(() {
      regno = Constants.sharedPref.getString("regno");
      });
  }

 Future<List> fetchResultData() async {
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH RESULT",
        "regno" : regno.toString(),
          });
        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;
      return courseData;
      }


      


@override
  void initState() {
   // _deleteCacheDir();
    //_deleteAppDir();
    getData();
    fetchResultData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchResultData(),
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
          ResultList(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester, request: widget.request,) 
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
                    'No Available Result'
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











class ResultList extends StatefulWidget {
  ResultList({this.selectedSemester, this.selectedClass, this.request});
  final selectedSemester;
  final String selectedClass;
  final String request;
  @override
  _ResultListState createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {

  getData() {
      setState(() {
      regno = Constants.sharedPref.getString("regno");
      });
  }

  Future<String> fetchResultData() async {
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH RESULT",
        "regno" : regno.toString(),
          });

        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;

      return "Success";
      }

@override
  void initState() {
    fetchResultData();
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Result(s)',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Quando',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700),
                  ),
                   CircleAvatar(
                  radius: 20,
                 child: Icon(Icons.file_download)
                )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
           Container(
             height: MediaQuery.of(context).size.height*0.73,
             child: courseData != null ? ListView.builder(
                shrinkWrap: true,
                 itemCount: courseData == null ? 0 : courseData.length,
                itemBuilder: (BuildContext context, int index) {
                   if (courseData != null) {
                      return coursesIcon(
                    context,
                    courseData[index]['semester'],
                    courseData[index]['level'],
                    courseData[index]['regno'],
                    (){
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResutView(selectedSemester: courseData[index]['semester'], regno: courseData[index]['regno'])));
                    }, 
                      () async{

                             showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm"),
                    content:
                        new Text("Are you sure you want to delete this course?"),
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
                                var id = courseData[index]['course_id'];
                                  await http.post("https://teamcoded.com.ng/elearning.php", body: {
                                      "request": "DELETE COURSE",
                                      "id": id,
                                      });
                               fetchResultData();
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
                    
                    fetchResultData(),
                  );
                   }else{
                     Center(child: CircularProgressIndicator());
                   }
                }
              
              ) :  Center(child: Text('Loading...', style: TextStyle(color: Colors.black),),),
           )
         ], 
        ),
      ),
    );
  }
}

Widget coursesIcon(context, String semester, String level, String code, Function route, Function route2, fetchCourseData){
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
                                      Image.asset('img/resuting.png',height: 80, width: 90,),
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
                                              semester,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontFamily: 'Quando',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600
                                              ),
                                              
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
                                            SizedBox( height: 5.0,),
                                            Text(
                                              "Click here to view your result",
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
                          icon: Icon(Icons.arrow_forward_ios,size: 20, color: Colors.black54,),
                          onPressed: (){}
                        )
                              ],
                            ),
                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
    ],
  );
}