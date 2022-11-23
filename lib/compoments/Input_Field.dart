import 'package:flutter/material.dart';


enum SingingCharacter { Traveler, Guide }
class InpuField extends StatefulWidget {
  const InpuField({Key? key}) : super(key: key);

  @override
  State<InpuField> createState() => _InpuFieldState();
}

class _InpuFieldState extends State<InpuField> {
  SingingCharacter? _character = SingingCharacter.Traveler;


  final TextEditingController _controllerFistname = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();



  Widget _entryRadio(
      ){
      return Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: 155,
            child: Stack(
              children: [
                ListTile(
                  title: const Text('Traveler'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Traveler,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 100,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            width: 155,
            child: Stack(
              children: [
                ListTile(
                  title: const Text('Guide'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.Guide,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
  }




  Widget _entryField(
      String title,
      TextEditingController controller,
      ) {
    var test = false;
    if (title == "Password") (test = true);
    return Padding(padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,style: TextStyle(fontSize: 18,color: Colors.black),),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey)
                      )
                  ),
                  child: TextField(
                    controller: controller,
                    obscureText: test,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            _entryRadio(),
        Row(
          children: [
            _entryField('Fist Name',_controllerFistname),
            SizedBox(
              width: 100,
            ),
            _entryField('Last Name',_controllerLastname)
          ],
        ),
      ],
    );
  }
}
