
import 'package:flutter/material.dart';
import 'package:synkrama_task/widgets/sizedbox.dart';

import '../Utils/colors.dart';

// ignore: must_be_immutable
class ProgressDialog extends StatelessWidget {
   ProgressDialog({super.key,required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: wColor,
          borderRadius: BorderRadius.circular(6)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
width4,
CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation(gColor),
)   ,
width24,
Text(message,style: TextStyle(
  color: gColor,
  fontSize: 12
),)
       ]),
        ),
      ),
    );
  }
}
