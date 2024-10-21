import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/view/global_widget/backbutton_widget.dart';
import 'package:todo_app/view/global_widget/button_widget.dart';
import 'package:todo_app/view/login_screen/login_screen.dart';
import 'package:todo_app/view/start_screen/start_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 22, right: 22, top: 45),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartScreen(),
                        ));
                  },
                  child: BackButton_widget()),
              SizedBox(height: 79),
              Center(
                child: Text(
                  'Welcome onboard!',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  "Let's help you meet up your task",
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.primarycolor),
                ),
              ),
              SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        hintText: 'Enter your Full Name',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Focused border color
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        String pattern =
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return 'Invalid format. Only alphanumeric characters allowed.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        hintText: 'Enter your Email address',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Focused border color
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        //String pattern =
                        //r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

                        if (value.length <= 6) {
                          return 'Invalid format. Only alphanumeric characters allowed.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        hintText: 'Create a password',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Focused border color
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                    SizedBox(height: 14),
                    TextFormField(
                      validator: (value) {
                        if (value != passwordcontroller.text) {
                          return "Password doesn't match";
                        }
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        hintText: 'Confirm your password',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Focused border color
                          borderRadius: BorderRadius.circular(11),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(11)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Center(
                  child: InkWell(
                child: Buttonwidget(text: 'Sign Up'),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    await TodoScreenController.addUser(namecontroller.text,
                        emailcontroller.text, passwordcontroller.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                },
              )),
              SizedBox(height: 80),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account?',
                        style: GoogleFonts.poppins(
                            color: ColorConstants.blackcolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' sign In',
                        style: GoogleFonts.poppins(
                            color: ColorConstants.primarycolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
