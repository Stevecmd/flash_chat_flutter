import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/components/rounded_button.dart';
import 'login_screen.dart';
import 'registration_screen.dart';


class WelcomeScreen extends StatefulWidget {

  static const String id = 'WelcomeScreen'; //static is a modifier, we are using it to modify the variable welcome_screen

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate); //animating the logo
    animation2 = ColorTween(begin:Colors.lightBlue[800], end: Colors.lightBlue[100]).animate(controller); //animating the background color
    controller.forward();
    controller.addListener(() {
      setState(() {

      });
      // print(controller.value);
      // print(animation.value);
    });
  }

  @override //disposing the animation controller once its done
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red.withOpacity(controller.value),
      // backgroundColor: Colors.white,
      backgroundColor: animation2.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    height: animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(  //animated text kit
                  // '${controller.value.toInt()}%', //Animating the loading screen with percentages
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'Log in', colour: Colors.lightBlueAccent,
              onPressed: () {
              //Go to login screen.
              Navigator.pushNamed(context, LoginScreen.id);
            },
            ),
            RoundedButton(title: 'Register', colour: Colors.blueAccent,
              onPressed: () {
                //Go to Registration screen.
                Navigator.pushNamed(context, RegistrationScreen.id);
              },),
          ],
        ),
      ),
    );
  }
}


