import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeService extends StatefulWidget {
  var title;
  var price;
  var image;
  var key;

  HomeService({Key? key, this.title, this.price, this.image,}) : super(key: key);


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
  @override
  Widget build(BuildContext context) {
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
                        AssetImage(widget.image),
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
                            children: const [
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
                                "1247 likes",
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
                          widget.title,
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
                          children: const [
                            Icon(accessTime,size: 15,),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "3 days",
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
                          widget.price,
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
}
