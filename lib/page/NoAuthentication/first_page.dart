import 'dart:async';

import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/NoAuthentication/seconed_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  void _startNavigate() {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SeconnedPage())
        ,);
    });

  }


  @override
  Widget build(BuildContext context) {
  _startNavigate();
    return Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/2.jpg"),
              fit: BoxFit.cover),
        ),
    );
  }
}
