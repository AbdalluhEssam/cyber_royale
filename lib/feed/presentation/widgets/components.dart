import 'package:flutter/material.dart';


Widget myDivider() => Container(
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 1,
    );

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context,widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );


 defaultAppbar({required BuildContext context, String? title,List<Widget>? actions
}) =>
    AppBar(
      leading: IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: const Icon(Icons.arrow_back)),
      title: Text("$title"),
      titleSpacing: 5,

      actions: actions,
    );
