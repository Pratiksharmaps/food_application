// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';

class alertdialog extends StatelessWidget {
  final String tittle;
  final String content;
  final Function() ButtonFunction;
  const alertdialog(
      {super.key,
      required this.tittle,
      required this.content,
      required this.ButtonFunction});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(25),
      titlePadding: const EdgeInsets.fromLTRB(20, 15, 0, 1),
      shape: const RoundedRectangleBorder(),
      title: Text(tittle),
      titleTextStyle: const TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color:  Colors.deepOrange),
      contentTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
      actionsAlignment: MainAxisAlignment.end,
      content: Text(content),
      actions: [
         GestureDetector(
          onTap: ButtonFunction,
           child: Container(
            
              alignment: Alignment.bottomRight,
              height: 33,
              width: 85,
              decoration:const  BoxDecoration(color: Colors.deepOrange),
              child: const Center(
                child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
         ),
        
      ],
    );
  }
}
void showAlertDialogBox(BuildContext context, String tittle, String content,
    Function() button_function) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return alertdialog(
          tittle: tittle,
          content: content,
          ButtonFunction: button_function,
        );
      }));
}

void hideProgressDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
