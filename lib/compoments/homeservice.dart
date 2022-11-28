import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeService extends StatefulWidget {
  final Map data;
  final String page;
  const HomeService({Key?key, required this.data, required this.page}) : super(key: key);


  @override
  State<HomeService> createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
  static const IconData navigateBefore =
  IconData(0xe41c, fontFamily: 'MaterialIcons', matchTextDirection: true);
  static const IconData signalCellular =
  IconData(0xe5a7, fontFamily: 'MaterialIcons');
  static const IconData batteryFull =
  IconData(0xe0d2, fontFamily: 'MaterialIcons');
  static const IconData wifi = IconData(0xe6e7, fontFamily: 'MaterialIcons');
  static const IconData bookmark =
  IconData(0xe0f1, fontFamily: 'MaterialIcons');
  static const IconData star = IconData(0xe5f9, fontFamily: 'MaterialIcons');
  static const IconData favorite =
  IconData(0xe25b, fontFamily: 'MaterialIcons');
  static const IconData calendarMonth =
  IconData(0xf06bb, fontFamily: 'MaterialIcons');
  static const IconData accessTime =
  IconData(0xe03a, fontFamily: 'MaterialIcons');

  // State đổi màu tim và đánh dấu
  var isMark = false;
  var isFavorite = false;


  Widget _bodyInHome(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(5, 0), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 280,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                    image: DecorationImage(
                      image:
                      NetworkImage('${this.widget.data['image']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){
                                if(isMark){
                                  setState(() {
                                    isMark = false;
                                  });
                                }else{
                                  setState(() {
                                    isMark = true;
                                  });
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 100,
                                      offset: Offset(1, 1), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  bookmark,
                                  size: 15,
                                  color: (() {
                                    if(isMark){
                                      return Colors.yellow;
                                    }else{
                                      return Colors.white;
                                    }
                                  }()),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children:  [
                            Icon(
                              star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            Icon(
                              star,
                              color: Colors.yellow,
                              size: 15,
                            ),
                            SizedBox(
                              width: 130,
                            ),
                            Text(
                              "${this.widget.data['likes']} likes",
                              style: TextStyle(
                                  fontFamily:
                                  "SF Pro Display",
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight:
                                  FontWeight.bold,
                                  fontStyle:
                                  FontStyle.normal,
                                  decoration:
                                  TextDecoration
                                      .none),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: 96,
            width: 300,
            color: Colors.white,
            padding: EdgeInsets.only(top: 10),
            child: Padding(
              padding:  EdgeInsets.only(left: 20,right: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${this.widget.data['title']}",
                        style:  TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            decoration:
                            TextDecoration.none),
                      ),
                      GestureDetector(
                        onTap: (){
                          if(isFavorite){
                            setState(() {
                              isFavorite = false;
                            });
                          }else{
                            setState(() {
                              isFavorite = true;
                            });
                          }
                        },
                        child: Icon(
                          favorite,
                          color: (() {
                            if(isFavorite){
                              return Colors.red;
                            }else{
                              return Colors.grey;
                            }
                          }()),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: const [
                      Icon(
                        calendarMonth,
                        color: Colors.black,
                        size: 15,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Jan 30, 2020",
                        style: TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            decoration:
                            TextDecoration.none),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.center,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Icon(accessTime,size: 15,),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${this.widget.data['days']} days",
                            style: TextStyle(
                                fontFamily: "SF Pro Display",
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                decoration:
                                TextDecoration.none),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        "${this.widget.data['price']}",
                        style: const TextStyle(
                            fontFamily: "SF Pro Display",
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            decoration:
                            TextDecoration.none),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bodyInTour(){
      return Container(
        width: 460,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 3), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 460,
                  height: 135,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                      image: DecorationImage(
                        image:
                        NetworkImage(this.widget.data['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(isMark){
                                    setState(() {
                                      isMark = false;
                                    });
                                  }else{
                                    setState(() {
                                      isMark = true;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 60,
                                        offset: Offset(0.5, 0.5), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    bookmark,
                                    size: 25,
                                    color: (() {
                                      if(isMark){
                                        return Colors.yellow;
                                      }else{
                                        return Colors.white;
                                      }
                                    }()),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children:  [
                              Icon(
                                star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              Icon(
                                star,
                                color: Colors.yellow,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${this.widget.data['likes']} likes",
                                style: TextStyle(
                                    fontFamily:
                                    "SF Pro Display",
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight:
                                    FontWeight.w300,
                                    fontStyle:
                                    FontStyle.normal,
                                    decoration:
                                    TextDecoration
                                        .none),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 96,
              width: 460,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                color: Colors.white
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${this.widget.data['title']}',
                          style:  TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              decoration:
                              TextDecoration.none),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(isFavorite){
                              setState(() {
                                isFavorite = false;
                              });
                            }else{
                              setState(() {
                                isFavorite = true;
                              });
                            }
                          },
                          child: Icon(
                            favorite,
                            color: (() {
                              if(isFavorite){
                                return Colors.red;
                              }else{
                                return Colors.grey;
                              }
                            }()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      children: const [
                        Icon(
                          calendarMonth,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Jan 30, 2020",
                          style: TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              decoration:
                              TextDecoration.none),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            Icon(accessTime),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${this.widget.data['days']} days",
                              style: TextStyle(
                                  fontFamily: "SF Pro Display",
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  decoration:
                                  TextDecoration.none),
                            ),
                          ],
                        ),

                        const SizedBox(
                          width: 187,
                        ),
                        Text(
                          '${this.widget.data['price']}',
                          style: const TextStyle(
                              fontFamily: "SF Pro Display",
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              decoration:
                              TextDecoration.none),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: this.widget.page=='home' ? _bodyInHome() :_bodyInTour()
    );
  }
}
