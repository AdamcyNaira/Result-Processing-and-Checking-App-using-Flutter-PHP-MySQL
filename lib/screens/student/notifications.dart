import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:result/screens/student/notificationView.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

List postList = [];


class GetNotifications extends StatefulWidget {

  @override
  _GetNotificationsState createState() => _GetNotificationsState();
}

class _GetNotificationsState extends State<GetNotifications> {


 var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 30.0,
);

 Future<List> fetchAnnouncement() async {
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH ALL ANNOUNCEMENT",
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        postList = convertDateToJson;
      });
      return postList;
      }


@override
  void initState() {
   fetchAnnouncement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAnnouncement(),
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
          Notifications() 
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
                    'No Available Notification'
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




class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

   Future<List> fetchAnnouncement() async {
      String fileName = "postData1.json";
      var dir = await getTemporaryDirectory();
      File file = new File(dir.path + "/" + fileName); 

      if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
       setState(() {
         postList = json.decode(jsonData);
       });
        final response =
        await http.post("https://teamcoded.com.ng/result.php", body: {
        "request": "FETCH ALL ANNOUNCEMENT",
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        postList = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);
        
      });
      return postList;
      }else{
        final response =
        await http.post("https://teamcoded.com.ng/elearning.php", body: {
        "request": "FETCH ALL ANNOUNCEMENT",
          });
        setState(() {
        var convertDateToJson = jsonDecode(response.body);
        postList = convertDateToJson;
        file.writeAsStringSync(response.body, flush: true, mode: FileMode.write);

      });
       return postList;
      }
      }


  @override
  void initState() {
    fetchAnnouncement();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: exAppBar(title: " ", context: context),
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
                'Notifications',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quando',
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700),
              ),
            ),
            
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: postList != null ? ListView.builder(
                  shrinkWrap: true,
                   itemCount: postList == null ? 0 : postList.length,
                  itemBuilder: (BuildContext context, int index) {
                        return tile(
                      context,
                      postList[index]['title'][0],
                      postList[index]['title'],
                      postList[index]['post'],
                      int.parse(postList[index]['announcement_id']),
                      (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnnouncementView(data: postList.where((element) => element['announcement_id'] == postList[index]['announcement_id']).toList(),)));
                      }
                    );
                     }
                  
                
                ) : Container(
              height: MediaQuery.of(context).size.height*0.7,
             width: MediaQuery.of(context).size.width,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline, color: Colors.black54,),
                    SizedBox(height: 5.0,),
                    Text(
                            'You do not have notifications',
                            style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'raleway',
                                fontSize: 18,),
                                textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
            ),)
         ], 
        ),
      ),
    );
  }
}



tile(context, String char, String heading, String post, int id, Function route){
  return Column(
                    children: [
                      Container(
                        // color: Color(0Xffffffff),
                        width: MediaQuery.of(context).size.width,

                        child: Card(
                          child: InkWell(
                            highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
                            splashColor: Colors.teal,
                                            onTap: route,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                                                        child: CircleAvatar(
                                                          radius: 25,
                                                          backgroundColor: id.isOdd ? Colors.teal : Color(0XFF657ED4),
                                                          child: Text(char),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(top:10.0),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                            Text(
                                                              heading,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                fontFamily: 'Quando',
                                                                color: Colors.black,
                                                                fontWeight: FontWeight.w600
                                                              ),
                                                              
                                                            ),
                                                            
                                                            SizedBox( height: 5.0,),
                                                            Text(
                                                              post,
                                                              style: TextStyle(
                                                                fontSize: 12.0,
                                                                color: Colors.black54,
                                                              ),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                            SizedBox( height: 25.0,),
                                                            
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
                                           
                                              ],
                                            ),
                                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                    ],
                  );
}
