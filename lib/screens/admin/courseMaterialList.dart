import 'dart:async';
import 'dart:convert';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

List courseData =[];
List countMat = [];




class GetCourseMaterialList extends StatefulWidget {
  GetCourseMaterialList({this.selectedSemester, this.selectedClass, this.request});
  final selectedSemester;
  final String selectedClass;
  final String request;
  @override
  _GetCourseMaterialListState createState() => _GetCourseMaterialListState();
}

class _GetCourseMaterialListState extends State<GetCourseMaterialList> {


   Future<List> fetchCourses() async {
        final response =
        await http.post("http://teamcoded.com.ng/elearning.php", body: {
        "request": "FETCH ALL COURSES",
        "classs" : widget.selectedClass,
        "semester" : widget.selectedSemester
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;
        
      });
      return courseData;
      }



 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

@override
  void initState() {
    fetchCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCourses(),
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
          CoursesMaterialList(selectedClass: widget.selectedClass, selectedSemester: widget.selectedSemester, request: widget.request,) 
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
                    'No Available Course Material'
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





class CoursesMaterialList extends StatefulWidget {
  CoursesMaterialList({this.selectedSemester, this.selectedClass, this.request});
  final selectedSemester;
  final String selectedClass;
  final String request;
  @override
  _CoursesMaterialListState createState() => _CoursesMaterialListState();
}

class _CoursesMaterialListState extends State<CoursesMaterialList> {

   Future<List> fetchCourses() async {
        final response =
        await http.post("http://teamcoded.com.ng/elearning.php", body: {
        "request": "FETCH ALL COURSES",
        "classs" : widget.selectedClass,
        "semester" : widget.selectedSemester
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        courseData = convertDateToJson;
        
      });
      return courseData;
      }


        Future<List> fetchMaterials() async {

        final response =
            await http.post('https://teamcoded.com.ng/elearning.php', body: {
          "request": "FETCH MATERIALS",
          "semester" : widget.selectedSemester,
          "class" : widget.selectedClass,
    });

      var convertDateToJson = jsonDecode(response.body);
      setState(() {
        countMat = convertDateToJson;
      });
      return countMat;
  }


bool isLoading = false;

var spinkit = SpinKitThreeBounce(
  color: Colors.teal,
  size: 20.0,
);

   void _showError(courseID){
    showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text("Course Material has already been added"),
                  actions: <Widget>[
                    Column(
                      children: [
                       isLoading ? Container(
                               child: Center(child: CircularProgressIndicator(strokeWidth: 1,))
                             ) : Text(''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FlatButton(
                              color: Colors.red[900],
                              onPressed: () async{
                                setState(() {
                                        isLoading  = true;
                                      });
                                 var id = courseID;
                                  await http.post("http://teamcoded.com.ng/elearning.php", body: {
                                      "request": "DELETE MATERIAL",
                                      "id": id,
                                      });
                               fetchCourses();
                               fetchMaterials();
                               Timer(Duration(seconds: 1), (){
                                  setState(() {
                                  isLoading  = false;
                                }); 
                                Navigator.pop(context);
                               });
                              

                              },
                              child: isLoading == true ?  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delete Course',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  
                                  Container(
                                   child: spinkit
                                 ) ,
                                ],
                              ) :  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delete Course',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                  ),
                                  
                                  Text(''),
                                ],
                              ),
                            ),
                            isLoading ? SizedBox(width: 30.0,) : SizedBox(width: 70.0,),
                            FlatButton(
                              color: Constants.kPrimaryColor.withOpacity(0.6),
                              onPressed: () {
                               Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ));
  }





@override
  void initState() {
    fetchCourses();
    fetchMaterials();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //  fetchCourses();
    // fetchMaterials();
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
              child: Text(
                'Course Materials',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: MediaQuery.of(context).size.height*0.73,
              child: ListView.builder(
                    shrinkWrap: true,
                     itemCount: courseData == null ? 0 : courseData.length,
                    itemBuilder: (BuildContext context, int index) {
                       if (courseData != null) {
                          return coursesIcon(
                        context,
                        courseData[index]['course_title'],
                        courseData[index]['lecturer'],
                        courseData[index]['course_code'],
                        (){
                          countMat.map((element) => element['course_id']).contains(courseData[index]['course_id']) 
                          ?
                          _showError(courseData[index]['course_id'])
                          :
                           Container();
                        }, 
                        countMat.map((element) => element['course_id']).contains(courseData[index]['course_id']) ? "YES" : "NO"
                        
                        //where((element) => element['course_id']=="10") ? "YES" : "NO",
                      );
                       }else{
                         Center(child: CircularProgressIndicator());
                       }
                    }
                  
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
      //                       builder: (context) => AddCourseMaterial(selectedSemester: widget.selectedSemester, selectedClass: widget.selectedClass,)));
      //   },
      //   child: Icon(Icons.add),
      //   elevation: 4,
      // ),
    );
  }
}

Widget coursesIcon(context, String course, String lecturer, String code, Function route, String status){
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('img/unname.png',height: 80, width: 90,),
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
                                        course,
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
                                        "Lecturer: $lecturer",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.black54,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox( height: 0.0,),
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Course Code: $code",
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black54,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                             status == "YES"  ? Padding(
                                                padding: const EdgeInsets.only(right: 5.0, bottom: 3.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                   color: Colors.teal,
                                                   borderRadius: BorderRadius.all(Radius.circular(5.0)), 
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                      "Added",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.white,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                ),
                                                Icon(Icons.check_circle_outline, size: 15.0, color: Colors.white,)
                                                    ],
                                                  ),
                                                ),
                                              ) : Padding(
                                                padding: const EdgeInsets.only(right: 5.0, bottom: 3.0),
                                                child: Container(
                                                  padding: EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                   color: Colors.orange[600],
                                                   borderRadius: BorderRadius.all(Radius.circular(5.0)), 
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                      "Not Added",
                                                      style: TextStyle(
                                                        fontSize: 12.0,
                                                        color: Colors.white,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                ),
                                                Icon(Icons.cancel, size: 15.0, color: Colors.white,)
                                                    ],
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
                             
                            SizedBox(
                              height: 5.0,
                            ),
                            
                          ],
                        ),
                      ),
                      ),
                    ),
                    SizedBox(height: 20,),
    ],
  );
}