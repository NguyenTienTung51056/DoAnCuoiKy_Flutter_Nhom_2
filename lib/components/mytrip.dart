import 'package:flutter/material.dart';

class MyTrip extends StatefulWidget {
  var guide;
  var nameGuide;
  var date;
  var time;
  var place;
  var city;
  var image;
  var finish;

  MyTrip(
      {Key? key,
      this.guide,
      this.nameGuide,
      this.date,
      this.time,
      this.place,
      this.city,
      this.image,
      this.finish})
      : super(key: key);

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  static const IconData markMap = IconData(0xe4c9, fontFamily: 'MaterialIcons');
  static const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');
  static const IconData info = IconData(0xf128, fontFamily: 'MaterialIcons');
  static const IconData accessTime =
      IconData(0xe03a, fontFamily: 'MaterialIcons');
  static const IconData calendarMonth =
      IconData(0xf06bb, fontFamily: 'MaterialIcons');
  static const IconData account = IconData(0xf522, fontFamily: 'MaterialIcons');
  late bool checkFinish = widget.finish;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 380,
                  height: 135,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              checkFinish = !checkFinish;
                            });
                          },
                          child: Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (() {
                                if (checkFinish) {
                                  return Colors.yellow;
                                } else {
                                  return Colors.white.withOpacity(0.4);
                                }
                              }()),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5, right: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    check,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Mark Finished',
                                    style: TextStyle(
                                      color: (() {
                                        if (checkFinish) {
                                          return Colors.black;
                                        } else {
                                          return Colors.black;
                                        }
                                      }()),
                                      fontFamily: "SF Pro Display",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Row(
                          children: [
                            const Icon(
                              markMap,
                              size: 20,
                              color: Colors.white,
                            ),
                            Text(
                              widget.city,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "SF Pro Display",
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.place,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: "SF Pro Display",
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children:  [
                            const Icon(
                              calendarMonth,
                              size: 20,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.date,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: "SF Pro Display",
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                            children: [
                              const Icon(
                                accessTime,
                                size: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  widget.time,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "SF Pro Display",
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                            ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                            children: [
                              const Icon(
                                  account,
                                size: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  widget.nameGuide,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: "SF Pro Display",
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                            ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                  children: const [
                                    Icon(
                                        info,
                                      size: 25,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("Detail"),
                                    SizedBox(
                                      width: 3,
                                    ),
                                  ],
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.grey,style: BorderStyle.solid,width: 4)
                            ),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('images/guide1.png'),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
