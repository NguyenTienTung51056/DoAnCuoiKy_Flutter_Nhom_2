import 'package:DoAnCuoiKy_Flutter_Nhom_2/auth.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/home_page.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/NoAuthentication/first_page.dart';
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
      builder: (context, snapshot) => snapshot.hasData ? HomePage() : FirstPage()
    );
  }
}
