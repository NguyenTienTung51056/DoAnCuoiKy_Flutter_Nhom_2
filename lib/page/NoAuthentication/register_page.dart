import 'dart:async';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/Input_Field.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/home_page2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerCountry = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage2()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  void _startNavigate() {
      Navigator.pop(context);
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
          onPressed: createUserWithEmailAndPassword,
          child: Text(
            'Register',
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
          Text("Do you have account ?"),
          TextButton(
            onPressed: () {
              _startNavigate();
            },
            child: Text(
             'Login'
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
        height: 1200,
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
                      "Sign Up",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InpuField(),
                  _entryField('Country', _controllerCountry),
                  _entryField('Email', _controllerEmail),
                  _entryField('Password', _controllerPassword),
                  _entryField('Comfirm Password', _controllerPassword),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      "Forgot password",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
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
