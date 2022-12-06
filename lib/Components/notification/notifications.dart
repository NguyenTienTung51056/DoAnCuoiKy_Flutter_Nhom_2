import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final List<Map<String, dynamic>> _allNotification = [
    {
      "id": 1,
      "notification":
          "Tuan Tran accepted your request for the trip \nin Danang, Vietnam on Jan 20, 2020",
      "avatar": "img/tuantran.png",
      "icon": Icons.favorite,
      "time": "1h ago",
      "color": Colors.green
    },
     {
      "id": 1,
      "notification":
          "Emmy sent you an offer for the trip in Ho Chi Minh,\n Vietnam on Feb 12, 2020",
      "avatar": "img/emmy.png",
      "icon": Icons.text_snippet, 
      "time": "1h ago",
      "color": Colors.orangeAccent
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('img/caurong.png'),
                fit: BoxFit.cover,
              )),
            ),
            Positioned(
                left: 5,
                top: 90,
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: _allNotification.length,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                width: double.infinity,
                child: Row(children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(_allNotification[index]
                                    ['avatar'].toString()),
                                fit: BoxFit.fill),
                          ),
                        ),
                        Positioned(
                            right: 15,
                            bottom: 15,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _allNotification[index]['color'],
                              ),
                              width: 20,
                              height: 20,
                              child: Center(
                                child: Icon(
                                  _allNotification[index]['icon'],
                                  color: Colors.white,
                                  size: 10,
                                ),
                              ),
                            )
                          ),
                      ],
                    ),
                  ),
                   SizedBox(
                            width: 15,
                          ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                _allNotification[index]['notification']
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                ]),
              );
            },
          ),
        )
      ],
    );
  }
}
