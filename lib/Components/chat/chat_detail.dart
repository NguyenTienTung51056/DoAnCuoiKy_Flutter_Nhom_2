import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tour_application_1/Components/chat/chat.dart';

class Detail_chat extends StatefulWidget {
  var chat_detail;
  var message;
  Detail_chat({Key? key, required this.chat_detail,this.message}) : super(key: key);

  @override
  State<Detail_chat> createState() => _Detail_chatState();
}

class Message {
  String? message;
  DateTime? time;
  bool? isMe;
  Message({this.message, this.time, this.isMe});
}

class _Detail_chatState extends State<Detail_chat> {
  @override
  Widget build(BuildContext context) {  
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.navigate_before,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 120,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.chat_detail),
                    maxRadius: 20,
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.call,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
        
        body: Column(
          children: [
            // Expanded là 1 widget giúp cho con của nó chiếm hết không gian còn lại
            Expanded(
                child: Container(
              // GroupedListView là 1 widget giúp cho con của nó được sắp xếp theo nhóm
              child: GroupedListView<dynamic, DateTime>(
                elements: widget.message,
                groupBy: (element) => element.time, //
                groupSeparatorBuilder: (DateTime value) => Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    value.toString(),
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                itemBuilder: (context, dynamic element) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: Align(
                      alignment: (element.isMe!
                          ? Alignment.topRight
                          : Alignment.topLeft),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (element.isMe!
                              ? Colors.blue[100]
                              : Colors.grey[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(element.message!),
                      ),
                    ),
                  );
                },
              ),
            )),

            Container(
              height: 40,
              color: Color.fromARGB(255, 243, 243, 243),
              child: SafeArea(
                  child: Row(
                children: [
                  Icon(Icons.camera_alt, color: Colors.greenAccent),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.image, color: Colors.greenAccent),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 204, 200, 200),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Nhập tin nhắn",
                        hintStyle: TextStyle(color: Colors.white),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 15),
                      ),
                    ),
                  )),
                  Icon(
                    Icons.send,
                    color: Colors.blueAccent,
                  )
                ],
              )),
            )
          ],
        ));
  }
}
