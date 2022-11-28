import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/auth.dart';
class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0,-5),
              blurRadius: 5,
              color:  Colors.black26,
            )
          ]
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 5),
                child: SvgPicture.asset("assets/icons/compass.svg",width: 35,height: 35,color: Colors.green,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50,top: 5),
                child: Text('Explore',style: TextStyle(color: Colors.green),),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 20),
              child: Icon(
                Icons.location_on,
                color: Colors.grey,
                size: 40,
              )
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 20),
              child: Icon(
                Icons.message,
                color: Colors.grey,
                size: 40,
              )
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 20),
              child: Icon(
                Icons.notifications_active_rounded,
                color: Colors.grey,
                size: 40,
              )
          ),
          Padding(
              padding: const EdgeInsets.only(left: 50,bottom: 40),
              child: IconButton(
                onPressed: ()=>signOut(),
                icon: Icon(
                  Icons.logout_rounded,
                  color: Colors.grey,
                  size: 40,
                ),
              )
          ),
        ],
      ),
    );
  }
}
