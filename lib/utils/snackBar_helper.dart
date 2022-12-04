import 'package:flutter/material.dart';


void showSuccessMessage(BuildContext context, {required String message}) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.greenAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


void showSuccessError(BuildContext context, {required String message}){
  final snackBar = SnackBar(content: Text(message),backgroundColor: Colors.redAccent,);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}