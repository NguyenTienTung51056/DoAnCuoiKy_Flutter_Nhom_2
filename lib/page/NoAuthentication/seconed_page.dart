import 'dart:async';

import 'package:authentication_firebase/page/NoAuthentication/login_register_page.dart';
import 'package:flutter/material.dart';

class SeconnedPage extends StatefulWidget {
  const SeconnedPage({Key? key}) : super(key: key);

  @override
  State<SeconnedPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<SeconnedPage> {
  void _startNavigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      height: 800,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
            height: 550,
            width: 700,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/1.png",
                ),
              ),
            ),
          ),
          Text(
            "Create a trip and get offers",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 250,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Fellow4U helps you save time and get offers from hundred local guides that suit your trip.",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 80),
            decoration: BoxDecoration(
                color: Color(0xFF00CEA6),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: TextButton(
                onPressed: () => _startNavigate(),
                child: Text(
                  'Get start',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
