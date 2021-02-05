import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:result/screens/admin/addAnnouncement.dart';
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:path_provider/path_provider.dart';

List postList = [];
class ManageAnnouncement extends StatefulWidget {


  @override
  _ManageAnnouncementState createState() => _ManageAnnouncementState();
}

class _ManageAnnouncementState extends State<ManageAnnouncement> {

   Future<List> fetchAnnouncement() async {
      String fileName = "postData.json";
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
        await http.post("https://teamcoded.com.ng/result.php", body: {
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Announcements',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quando',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 40.0,),
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
                      () async{

                             showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: new Text("Confirm"),
                    content:
                        new Text("Are you sure you want to delete this announcement?"),
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
                                var id = postList[index]['announcement_id'];
                                  await http.post("https://teamcoded.com.ng/result.php", body: {
                                      "request": "DELETE ANNOUNCEMENT",
                                      "id": id,
                                      });
                               fetchAnnouncement();
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
                    );
                     }
                  
                
                ) :  Center(child: Text('Loading...', style: TextStyle(color: Colors.black),),)
            ),
           ], 
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
       onPressed: (){
          Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddAnnouncement()));
       },
       elevation: 5, 
      ),
    );
  }
}


tile(context, String char, String heading, String post, int id, Function route2){
  return Column(
                    children: [
                      Container(
                        // color: Color(0Xffffffff),
                        width: MediaQuery.of(context).size.width,

                        child: Card(
                          child: InkWell(
                            highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
                            splashColor: Colors.teal,
                                            onTap: (){},
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
                                            IconButton(
                                              icon: Icon(Icons.delete,size: 25, color: Colors.black54,),
                                              onPressed: route2
                                            )
                                              ],
                                            ),
                                          ),
                        ),
                      ),
                      SizedBox(height: 5.0,),
                    ],
                  );
}
