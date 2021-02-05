
import 'package:result/util/constants.dart';
import 'package:result/widgets/users_widget.dart';
import 'package:flutter/material.dart';



class AnnouncementView extends StatefulWidget {
  AnnouncementView({this.data});
  final List data;

  @override
  _AnnouncementViewState createState() => _AnnouncementViewState();
}

class _AnnouncementViewState extends State<AnnouncementView> {


  var result;
  @override
  void initState() {
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
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Message',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quando',
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 40.0,),
              ListView(
                primary: false,
                shrinkWrap: true,
                children: [
                  SizedBox(
                      height: 10,
                    ),
                     Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(
                          widget.data[0]['title'],
                          style: TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600),
                        ),
                      ),

                      Divider(
                        height: 10.0,
                      ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                    //   child: TextFormField(
                    //     validator: (val) => val.length == 0 ? 'Enter title' : null,
                    //     style: TextStyle(fontSize: 12, color: Colors.black, fontFamily: 'Raleway',),
                    //     decoration: InputDecoration(
                    //       hintText: widget.data[0]['post'],
                    //       contentPadding: const EdgeInsets.all(15.0),
                    //       filled: true,
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.0,
                    ),
                     Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 5.0),
                        child: Text(
                          "Post ",
                          style: TextStyle(fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(3),
                         color: Colors.grey[300]
                        ),
                        child: Text(
                          widget.data[0]['post'],
                          style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                        ),
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



