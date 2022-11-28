import 'package:authentication_firebase/auth.dart';
import 'package:authentication_firebase/page/Authenticated/home_page.dart';
import 'package:authentication_firebase/page/Authenticated/guides.dart';
import 'package:authentication_firebase/page/Authenticated/tours.dart';
import 'package:authentication_firebase/page/NoAuthentication/check_email.dart';
import 'package:authentication_firebase/page/NoAuthentication/first_page.dart';
import 'package:authentication_firebase/page/Authenticated/home_page2.dart';
import 'package:authentication_firebase/page/Authenticated/todolist.dart';
import 'package:authentication_firebase/page/NoAuthentication/forgot_password.dart';
import 'package:authentication_firebase/page/NoAuthentication/login_register_page.dart';
import 'package:authentication_firebase/page/NoAuthentication/register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return  FirstPage();
        }
      },
    );
  }
}
