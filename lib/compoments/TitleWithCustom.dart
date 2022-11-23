import 'package:flutter/material.dart';

class TitleWithCusTom extends StatelessWidget {
  const TitleWithCusTom({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 24,
      child: Stack(
        children: [
          Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 35.0/4),
              height: 7,
            ),
          )
        ],
      ),
    );
  }
}
