import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/tourApplication/chat/chat_detail.dart';
import 'package:flutter/material.dart';



class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class Message {
  String? message;
  DateTime? time;
  bool? isMe;
  Message({this.message, this.time, this.isMe});
}

class _ChatState extends State<Chat> {
  List<Map<String, dynamic>> _allUser = [
    {
      "id": 1,
      "name": "Nguyen Van A",
      "img": "images/tourApplication/Restaurant.png",
      "icon": "Icons.favorite",
      "message": [
        Message(
            message: "a sờ lô lô",
            // time chỉ cần hiện giờ và phút
            time: DateTime.now(),
            isMe: false),
        Message(message: "aloo", time: DateTime.now(), isMe: true),
        Message(
            message: "mượn xe tý đê",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(
            message: "a sờ lô lô",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(
            message: "aloo",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: true),
        Message(
            message: "It’s a beautiful place",
            time: DateTime.now(),
            isMe: false),
      ],
    },
    {
      "id": 2,
      "name": "Trần Van B",
      "img": "images/tourApplication/chooo.png",
      "icon": "Icons.favorite_border",
      "message": [
        Message(
            message: "nộp bài tập nè bạn",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(message: "aloo", time: DateTime.now(), isMe: false),
        Message(
            message: "a sờ lô lô",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: true),
        Message(
            message: "We can start at 8am",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: true),
      ],
    },
    {
      "id": 3,
      "name": "Tang Van C",
      "img": "images/tourApplication/emmy.png",
      "icon": "Icons.favorite",
      "message": [
        Message(
            message: "m làm được không",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(message: "không", time: DateTime.now(), isMe: true),
      ],
    },
    {
      "id": 4,
      "name": "Nguyen Van D",
      "img": "images/tourApplication/tuantran.png",
      "icon": "Icons.favorite",
      "message": [
        Message(
            message: "a sờ lô lô",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(message: "aloo", time: DateTime.now(), isMe: true),
        Message(
            message: "a sờ lô lô",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: false),
        Message(
            message: "aloo",
            time: DateTime.now().subtract(Duration(minutes: 1)),
            isMe: true),
        Message(message: "See you tomorrow", time: DateTime.now(), isMe: false),
      ],
    },
  ];
  List<Map<String, dynamic>> _foundUser = [];

  @override
  void initState() {
    _foundUser = _allUser;
    super.initState();
  }

  @override
  void _searchUser(String value) {
    List<Map<String, dynamic>> _searchUser = [];
    if (!value.isEmpty) {
      _searchUser = _allUser
          .where((element) =>
              element["name"].toString().toLowerCase().contains(value))
          .toList();
    } else {
      _searchUser = _allUser;
    }
    setState(() {
      _foundUser = _searchUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/tourApplication/caurong.png'),
                  fit: BoxFit.cover,
                )),
              ),
              Positioned(
                  left: 5,
                  top: 90,
                  child: Text(
                    'Chat',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )),
            ],
          ),
          Container(
            width: double.infinity,
            margin: new EdgeInsets.only(top: 10, left: 20, right: 20),
            child: TextField(
              onChanged: (value) {
                _searchUser(value);
              },
              decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _foundUser.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 64,
                      height: 64,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage(_foundUser[index]["img"].toString()),
                      ),
                    ),
                    title: Text(
                      _foundUser[index]["name"],
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                        _foundUser[index]["message"].last.message.toString()),
                    trailing: Text(
                      _foundUser[index]["message"].last.time.toString(),
                      style: TextStyle(fontSize: 10),
                    ),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail_chat(
                              chat_detail: _foundUser[index]["img"],
                              message: _foundUser[index]["message"],
                            ),
                          ))
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
