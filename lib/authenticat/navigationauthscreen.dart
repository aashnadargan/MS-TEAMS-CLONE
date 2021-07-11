import 'package:flutter/material.dart';
import 'package:teams_clone/authenticat/loginscreen.dart';
import 'package:teams_clone/authenticat/registerscreen.dart';
import 'package:teams_clone/variables.dart';

class NavigateAuthScreen extends StatefulWidget {
  const NavigateAuthScreen({Key? key}) : super(key: key);

  @override
  _NavigateAuthScreenState createState() => _NavigateAuthScreenState();
}

class _NavigateAuthScreenState extends State<NavigateAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(140, 22, 219, 1), Color.fromRGBO(99, 45, 135, 1)])),
            child: Center(
              child: Image.asset('images/logo.png', height: 300),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.8,
                margin: EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen())),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromRGBO(140, 22, 219, 1), Color.fromRGBO(99, 45, 135, 1)]
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style: mystyle(30, Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen())),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.deepPurple)
                            ),
                        child: Center(
                          child: Text(
                            "SIGN UP",
                            style: mystyle(30, Colors.deepPurple),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
