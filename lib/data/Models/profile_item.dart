import 'package:flutter/material.dart';

class ProfileItem {
  String title;
  String enteredText;
  TextEditingController textController;
  Function callBack;

  ProfileItem(
      {required this.title,
      required this.enteredText,
      required this.textController,
      required this.callBack});
}
