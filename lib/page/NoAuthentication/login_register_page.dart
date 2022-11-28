import 'dart:async';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/home_page.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/NoAuthentication/forgot_password.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/NoAuthentication/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  void _startNavigate(String name) {
    if (name == 'register') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterPage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPassword()),
      );
    }
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    var test = false;
    if (title == "Password") (test = true);
    return Padding(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))),
                  child: TextField(
                    controller: controller,
                    obscureText: test,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _errorMessage() {
    return Center(
        child: Text(
      errorMessage == '' ? '' : 'Humm ? $errorMessage',
      style: TextStyle(color: Colors.redAccent),
    ));
  }

  Widget _submitButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Color(0xFF00CEA6), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextButton(
          onPressed: signInWithEmailAndPassword,
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135),
      child: Row(
        children: [
          Text("Don't you have account ?"),
          TextButton(
            onPressed: () {
              _startNavigate('register');
            },
            child: Text(
              'Register',
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 900,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFF00CEA6), Color(0xFF00CEA6)])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Icon(
                Icons.train_outlined,
                size: 65,
                color: Colors.white,
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
                    child: Text(
                      "Sign In",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 0, 0),
                    child: Text(
                      "Welcome back, Yoo Jin",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00CEA6)),
                    ),
                  ),
                  _entryField('Email', _controllerEmail),
                  _entryField('Password', _controllerPassword),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextButton(
                        onPressed: () => _startNavigate('forgot'),
                        child: Text(
                          'Forgot for password',
                          style: TextStyle(color: Colors.grey[600]),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _errorMessage(),
                  SizedBox(
                    height: 10,
                  ),
                  _submitButton(),
                  SizedBox(
                    height: 30,
                  ),
                  Center(child: Text('or sign in with')),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 160),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/fb.svg',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/talk.svg',
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icons/t.svg',
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  _loginOrRegisterButton(),
                ],
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
