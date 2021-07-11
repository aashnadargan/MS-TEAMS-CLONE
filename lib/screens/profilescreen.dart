import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:teams_clone/variables.dart';

class ProfileScreen extends StatefulWidget {
    @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = '';
  bool dataisthere = false;
  TextEditingController usernamecontroller = TextEditingController();
  @override
  void initState() {
   
    super.initState();
    getuserdata();
  }
  
  getuserdata()async{
    DocumentSnapshot userdoc = 
    await usercollection.doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      username= (userdoc.data() as dynamic)["username"];
      dataisthere=true;
    });
  }
  
  editprofile() async {
   usercollection.doc(FirebaseAuth.instance.currentUser!.uid).update({
     'username' : usernamecontroller.text
   });
   setState(() {
     username = usernamecontroller.text;
   });
   Navigator.pop(context);
  }

  openeditprofiledialog() async{
    return showDialog(
      context: context,
       builder: (context){
         return Dialog(
           child : Container(
             height : 200,
             child : Column(
             children :[
               SizedBox(height: 30,),
               Container(
                 margin:EdgeInsets.only(left: 30,right: 30) ,
                 child: TextField(
                   controller: usernamecontroller,
                   style : mystyle(18, Colors.black),
                   decoration: InputDecoration(
                     labelText: "Update Username ",
                     labelStyle: mystyle(16,Colors.grey)
                   ),
                 ),
               ),
             SizedBox( height: 40,),
             InkWell(
                     onTap: ()=> editprofile(),
                     child: Container(
                       width: MediaQuery.of(context).size.width / 2,
                       height: 40,
                       decoration: BoxDecoration(
                         gradient: LinearGradient(colors:  [Color.fromRGBO( 245, 64, 51,1), Color.fromRGBO(214, 58, 47, 1)])
                       ),
                       child: Center(
                         child: Text("Update now!",
                         style: mystyle(17,Colors.white) ),
                       ),
                     ),
                   )
             ],
           ),
           ),
         );
        
       });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: dataisthere == false
      ? Center(
        child: CircularProgressIndicator() ,
        )
        : Stack(
        children: [
          ClipPath(
            clipper:OvalBottomBorderClipper() ,
            child: Container(
              width: double.infinity,
              height:MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(140, 22, 219, 1), Color.fromRGBO(99, 45, 135, 1)])

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width/ 2 - 64,
              top: MediaQuery.of(context).size.height / 3.1
            ),
            child: CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage('https://cdn3.vectorstock.com/i/1000x1000/10/02/thin-purple-user-icon-purple-gradient-linear-sign-vector-23541002.jpg'),
            ) ,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  SizedBox(height: 300,),
                  Text(
                    username, 
                  style: mystyle(40,Colors.black),
                   textAlign: TextAlign.center,
                   ),
                   SizedBox(height: 30),
                   InkWell(
                     onTap: ()=> openeditprofiledialog(),
                     child: Container(
                       width: MediaQuery.of(context).size.width / 2,
                       height: 40,
                       decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [Color.fromRGBO( 245, 82, 37,1), Color.fromRGBO(214, 58, 47, 1)])
                       ),
                       child: Center(
                         child: Text("Edit Profile",style: mystyle(17,Colors.white) ),
                       ),
                     ),
                   )
              ],
            ))
        ],
      ),
    );
  }
}