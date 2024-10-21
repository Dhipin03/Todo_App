import 'package:flutter/material.dart';
import 'package:todo_app/utils/constants/color_constants.dart';

class BackButton_widget extends StatelessWidget {
  const BackButton_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34, // size of the CircleAvatar
      height: 26,
      decoration: BoxDecoration(
        color: ColorConstants.primarycolor.withOpacity(0.5),
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorConstants.blackcolor, // border color
          width: 2.0, // border thickness
        ),
      ),
      child: Icon(
        Icons.arrow_back,
        size: 18,
      ),
    );
  }
}
