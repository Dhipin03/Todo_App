import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/global_widget/button_widget.dart';
import 'package:todo_app/view/todo_screen/todo_screen.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  TextEditingController taskcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 133),
              child: Text(
                'Welcome onboard!',
                style: GoogleFonts.poppins(
                    color: ColorConstants.blackcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.only(left: 99, right: 48),
              child: Image.asset(ImageConstants.addtaskscreeenimg),
            ),
            SizedBox(height: 20),
            Text(
              'Add what you want to do later on..',
              style: GoogleFonts.poppins(
                  color: ColorConstants.primarycolor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
            SizedBox(height: 28),
            Padding(
              padding: EdgeInsets.only(left: 29, right: 22),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some task';
                    }
                    return null;
                  },
                  controller: taskcontroller,
                  decoration: InputDecoration(
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
              ),
            ),
            SizedBox(height: 27),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await TodoScreenController.addtask(taskcontroller.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TodoScreen(
                          username: TodoScreenController.currentUser['name']
                              as String,
                        ),
                      ));
                }
              },
              child: Buttonwidget(
                text: 'Add to list',
              ),
            )
          ],
        ),
      ),
    );
  }
}
