import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/global_widget/button_widget.dart';
import 'package:todo_app/view/signup_screen/signup_screen.dart';
import 'package:todo_app/view/todo_screen/todo_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 20),
              child: Image.asset(ImageConstants.startscreenimg),
            ),
            SizedBox(height: 40),
            Text(
              'Get things done with TODO',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 20),
            ),
            SizedBox(height: 52),
            InkWell(
                onTap: () {
                  if (TodoScreenController.islogined) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TodoScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  }
                },
                child: Center(child: Buttonwidget(text: 'Get Started')))
          ],
        ),
      ),
    );
  }
}
