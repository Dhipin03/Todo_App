import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/controller/todo_screen_controller.dart';
import 'package:todo_app/utils/constants/color_constants.dart';
import 'package:todo_app/utils/constants/image_constants.dart';
import 'package:todo_app/view/taskAdd_screen/taskAdd_screen.dart';

class TodoScreen extends StatefulWidget {
  final String? username;
  const TodoScreen({super.key, this.username});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isChecked = false;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await TodoScreenController.gettask();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 84),
                child: Image.asset(ImageConstants.youngwomenimg),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Todo Tasks.',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 21),
                    Container(
                      height: 350,
                      margin: EdgeInsets.only(right: 15),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorConstants.greycolor,
                                spreadRadius: 5,
                                blurRadius: 2,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: ColorConstants.whitecolor),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Daily Tasks.',
                                    style: GoogleFonts.poppins(
                                        color: ColorConstants.greycolor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TaskAddScreen(),
                                          ));
                                    },
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor:
                                          ColorConstants.blackcolor,
                                      child: Icon(
                                        Icons.add,
                                        color: ColorConstants.whitecolor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Scrollbar(
                                trackVisibility: true,
                                child: ListView.builder(
                                  itemBuilder: (context, index) => ListTile(
                                    leading: GestureDetector(
                                      onTap: () async {
                                        // await TodoScreenController.deletetask(
                                        //     TodoScreenController.tasklist[index]
                                        //         ['id']);
                                        setState(() {});
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            ColorConstants.primarycolor,
                                        radius: 8,
                                      ),
                                    ),
                                    title: Text(
                                      TodoScreenController.tasklist[index]
                                          ['task'],
                                      style: GoogleFonts.poppins(
                                          color: ColorConstants.blackcolor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13),
                                    ),
                                  ),
                                  itemCount:
                                      TodoScreenController.tasklist.length,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTitleSection() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22)),
          color: ColorConstants.primarycolor.withOpacity(0.8)),
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 48),
        child: Column(
          children: [
            Image.asset(
              'assets/images/check (1).png',
              width: 70,
              height: 70,
            ),
            SizedBox(height: 15),
            Text(
              'Welcome ${widget.username}',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
