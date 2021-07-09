import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:teams_clone/authenticat/navigationauthscreen.dart';
import 'package:teams_clone/variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  IntroAuthScreenState createState() => IntroAuthScreenState();
}

class IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to Microsoft Teams, this is where work happens ",
          image: Center(
            child: Image.asset('images/welcome.png', height: 175),
          ),
          decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black)),
        ),
        PageViewModel(
          title: "Join or start meetings",
          body: "Easy to use interface, join or start meetings instantly  ",
          image: Center(
            child: Image.asset('images/meeting.jpg', height: 175),
          ),
          decoration: PageDecoration(
              bodyTextStyle: mystyle(20, Colors.black),
              titleTextStyle: mystyle(20, Colors.black)),
        ),
        PageViewModel(
          title: "Security",
          body:
              "Your security is important for us. Our servers are secure and reliable ",
          image: Center(
            child: Image.asset('images/security.png', height: 175),
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          ),
        )
      ],
      onDone: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigateAuthScreen()));
      },
      onSkip: () {},
      showSkipButton: true,
      skip: const Icon(Icons.skip_next, size: 45),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text(
        "Done",
        style: mystyle(20, Colors.black),
      ),
    );
  }
}
