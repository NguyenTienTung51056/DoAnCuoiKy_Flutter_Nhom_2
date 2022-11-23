import 'package:firebase_auth/firebase_auth.dart';
import '../../auth.dart';
import 'package:flutter/material.dart';


class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
  }

  Widget _title(){
      return const Text('Firebase Auth',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),);
  }

  Widget _userUid(){
    return Text(user?.email ?? 'User email');
  }

   Widget _signOutButton() {
     return ElevatedButton(
       style: ButtonStyle(
         foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
         backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)
       ),
       onPressed: signOut,
       child: const Text('Sign Out'),
     );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),bottomLeft: Radius.circular(12))
                  ),
                  child: Center(
                    child: _title(),
                  )
                ),
              ),
              Container(
                height: 500,
                width: 200,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _userUid(),
                    SizedBox(height: 30,),
                    _signOutButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
