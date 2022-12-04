import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/myTrip/customshape.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/NoAuthentication/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/auth.dart';
class Bottom extends StatefulWidget {
  final Function(String) navigateToPage;
  final String pages;
  const Bottom({Key? key,required this.navigateToPage,required this.pages}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  static const IconData explore = IconData(0xf037, fontFamily: 'MaterialIcons');
  static const IconData markMap = IconData(0xe4c9, fontFamily: 'MaterialIcons');
  static const IconData chat = IconData(0xf019f, fontFamily: 'MaterialIcons');
  static const IconData notifications = IconData(0xe450, fontFamily: 'MaterialIcons');
  static const IconData logout = IconData(0xe3b3, fontFamily: 'MaterialIcons');


  final User? user = Auth().currentUser;

  Future<void> signOut() async{
    await Auth().signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage())
      ,);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: SizedBox(
        height: 90,
        width: 500,
        child: Container(
          color: Colors.blueGrey.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.only(top: 35,left: 10,right: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => widget.navigateToPage('explore'),
                      child:Icon(
                        explore,
                        size: 30,
                        color: widget.pages == 'explore' ? Colors.green : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () => widget.navigateToPage('myTrip'),
                      child: Icon(
                        markMap,
                        size: 30,
                        color: widget.pages == 'myTrip' ? Colors.green : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () => widget.navigateToPage('messages'),
                      child:  Icon(
                        chat,
                        size: 30,
                        color: widget.pages == 'messages' ? Colors.green : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () => widget.navigateToPage('notification'),
                      child:  Icon(
                        notifications,
                        size: 30,
                        color: widget.pages == 'notification' ? Colors.green : Colors.grey,
                      ),
                    ),
                    InkWell(
                      onTap: () => signOut(),
                      child: const Icon(
                        logout,
                        size: 30,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
