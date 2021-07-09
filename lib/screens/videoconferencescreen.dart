import 'package:flutter/material.dart';
import 'package:teams_clone/variables.dart';
import 'package:teams_clone/videoconference/createmeeting.dart';
import 'package:teams_clone/videoconference/joinmeeting.dart';

class VideoConferenceScreen extends StatefulWidget {
   @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> 
with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  buildtab( String name){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text( name, style: mystyle(15,Colors.black, FontWeight.w700),) ,
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Teams",
           style: mystyle(20,Colors.white, FontWeight.w700),
        ),
        bottom : TabBar(
          controller: tabController,
          tabs: [
            buildtab("Join Meeting"),
            buildtab("Create Meeting")
          ],
        )
      
      ),
      body: TabBarView(
        controller: tabController,
        children: [
        JoinMeeting(),
        CreateMeeting(),
      
      ]),
    );
  }
}