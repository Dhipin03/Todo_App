import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/global_widget/backbutton_widget.dart';
import 'package:todo_app/view/global_widget/button_widget.dart';
import 'package:todo_app/view/signup_screen/signup_screen.dart';
import 'package:todo_app/view/todo_screen/todo_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await TodoScreenController.getUser();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 22, right: 22, top: 45),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ));
                    },
                    child: BackButton_widget()),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 91),
              Text(
                'Welcome Back!',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 22),
              Image.asset(
                ImageConstants.loginscreenimg,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 44),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
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
                    SizedBox(height: 24),
                    TextFormField(
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 13),
                        hintText: 'Confirm Password',
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
              SizedBox(height: 24),
              Text(
                'Forgot Password ?',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: ColorConstants.primarycolor),
              ),
              SizedBox(height: 34),
              InkWell(
                  onTap: () async {
                    setState(() {});
                    if (_formKey.currentState!.validate()) {
                      bool res = await TodoScreenController.isRegistered(
                          emailcontroller.text, passwordcontroller.text);
                      if (res) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TodoScreen(
                                username: TodoScreenController
                                    .currentUser['name'] as String,
                              ),
                            ));
                      } else {
                        // Show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password')),
                        );
                      }
                    }
                  },
                  child: Buttonwidget(text: 'Sign in')),
              SizedBox(height: 54),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ));
                },
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Dont have an account ?',
                      style: GoogleFonts.poppins(
                          color: ColorConstants.blackcolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: ' Sign Up',
                      style: GoogleFonts.poppins(
                          color: ColorConstants.primarycolor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
