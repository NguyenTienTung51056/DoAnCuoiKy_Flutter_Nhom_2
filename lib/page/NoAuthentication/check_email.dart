
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CheckEmail extends StatefulWidget {
  const CheckEmail({Key? key}) : super(key: key);

  @override
  State<CheckEmail> createState() => CheckEmailState();
}

class CheckEmailState extends State<CheckEmail> {
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();



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



  Widget _submitButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
          color: Color(0xFF00CEA6), borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextButton(
          onPressed: (){},
          child: Text(
            'Send',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginOrRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 175),
      child: Row(
        children: [
          Text("Back to sign in"),
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
            height: 800,
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
                              "Check Email",
                              style:
                              TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 30, 40, 0),
                            child: Text(
                              "Please check your email for the instructions on how to reset your password.",
                              style:
                              TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/email.jpg')
                                )
                              ),
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
