import 'package:flutter/material.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/TitleWithCustom.dart';

class ButtonWithCustome extends StatelessWidget {
  const ButtonWithCustome({Key? key, required this.title, required this.press}) : super(key: key);

  final String title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          TitleWithCusTom(text:title),
          Spacer(),
          TextButton(
              onPressed: ()=>press(),
              child: Text('See more',style: TextStyle(fontSize: 15,color: Colors.green),)
          )
        ],
      ),
    );
  }
}
