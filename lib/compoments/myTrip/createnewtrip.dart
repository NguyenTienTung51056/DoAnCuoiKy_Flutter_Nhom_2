import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class CreateTrip extends StatefulWidget {
  const CreateTrip({Key? key}) : super(key: key);

  @override
  State<CreateTrip> createState() => _CreateTripState();
}

class _CreateTripState extends State<CreateTrip> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  static const IconData signalCellular =
      IconData(0xe5a7, fontFamily: 'MaterialIcons');
  static const IconData batteryFull =
      IconData(0xe0d2, fontFamily: 'MaterialIcons');
  static const IconData wifi = IconData(0xe6e7, fontFamily: 'MaterialIcons');
  static const IconData calendarMonth =
      IconData(0xf06bb, fontFamily: 'MaterialIcons');
  static const IconData accessTime =
      IconData(0xe03a, fontFamily: 'MaterialIcons');
  static const IconData markMap = IconData(0xe4c9, fontFamily: 'MaterialIcons');
  static const IconData account = IconData(0xf522, fontFamily: 'MaterialIcons');
  static const IconData money = IconData(0xe0b2, fontFamily: 'MaterialIcons');
  static const IconData close = IconData(0xe16a, fontFamily: 'MaterialIcons');
  static const IconData down = IconData(0xe098, fontFamily: 'MaterialIcons');
  static const IconData up = IconData(0xe09a, fontFamily: 'MaterialIcons');

  final url = "https://638be677d2fc4a058a4f5950.mockapi.io/trip/alltrip";

  void createTrip(city, date, time, image) async {
    final response = await post(Uri.parse(url), body: {
      "city": city,
      "date": date,
      "time": time,
      "image": image,
    });
  }

  late String city;
  late String date;
  late String time;
  late String image;
  bool img1 = false;
  bool img2 = false;
  bool img3 = false;
  bool img4 = false;

  static const IconData check = IconData(0xe156, fontFamily: 'MaterialIcons');

  var number = 1;
  void onChangeCity(String temp) {
    setState(() {
      city = temp;
    });
  }

  void onChangeDate(String temp) {
    setState(() {
      date = temp;
    });
  }

  void onChangeTime(String temp) {
    setState(() {
      time = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DigitalClock(
                        areaDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        areaAligment: AlignmentDirectional.center,
                        // showSecondsDigit: false,
                        secondDigitDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        hourMinuteDigitDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        hourMinuteDigitTextStyle:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        secondDigitTextStyle:
                            const TextStyle(fontSize: 11, color: Colors.black),
                      ),
                      Row(
                        children: const [
                          Icon(signalCellular, size: 20, color: Colors.black),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            wifi,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(batteryFull,
                                size: 20, color: Colors.black),
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          close,
                          size: 33,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      const Text(
                        "Create New Trip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),

            // body

            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 500,
                  height: 1000,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Where you want to explore",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: controller,
                          onChanged: onChangeCity,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              markMap,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Date",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: controller2,
                          onChanged: onChangeDate,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                calendarMonth,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: "mm/dd/yy"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Time",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextField(
                          controller: controller3,
                          onChanged: onChangeTime,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                accessTime,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: "hh:mm - hh:mm"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Number of travelers",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  number = number - 1;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: const Icon(
                                  down,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text("$number"),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  number = number + 1;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: const Icon(
                                  up,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Fee",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                money,
                                size: 20,
                                color: Colors.grey,
                              ),
                              hintText: "\$/hour"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Guide’s Language",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              account,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Text(
                          "Attractions",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      image = "images/img3.png";
                                      img1 = !img1;
                                      img2 = false;
                                      img3 = false;
                                      img4 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("images/img3.png"),
                                            fit: BoxFit.cover)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: (() {
                                                if (img1) {
                                                  return Colors.white;
                                                } else {
                                                  return Colors.white.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                            child: Icon(
                                              check,
                                              size: 20,
                                              color: (() {
                                                if (img1) {
                                                  return Colors.black;
                                                } else {
                                                  return Colors.black.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      image = "images/img4.png";
                                      img2 = !img2;
                                      img1 = false;
                                      img3 = false;
                                      img4 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("images/img4.png"),
                                            fit: BoxFit.cover)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: (() {
                                                if (img2) {
                                                  return Colors.white;
                                                } else {
                                                  return Colors.white.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                            child: Icon(
                                              check,
                                              size: 20,
                                              color: (() {
                                                if (img2) {
                                                  return Colors.black;
                                                } else {
                                                  return Colors.black.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      image = "images/myTrip/img5.png";
                                      img3= !img3;
                                      img2 = false;
                                      img1 = false;
                                      img4 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("images/myTrip/img5.png"),
                                            fit: BoxFit.cover)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: (() {
                                                if (img3) {
                                                  return Colors.white;
                                                } else {
                                                  return Colors.white.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                            child: Icon(
                                              check,
                                              size: 20,
                                              color: (() {
                                                if (img3) {
                                                  return Colors.black;
                                                } else {
                                                  return Colors.black.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      image = "images/myTrip/img6.png";
                                      img4 = !img4;
                                      img2 = false;
                                      img3 = false;
                                      img1 = false;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 100,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("images/myTrip/img6.png"),
                                            fit: BoxFit.cover)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: (() {
                                                if (img4) {
                                                  return Colors.white;
                                                } else {
                                                  return Colors.white.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                            child: Icon(
                                              check,
                                              size: 20,
                                              color: (() {
                                                if (img4) {
                                                  return Colors.black;
                                                } else {
                                                  return Colors.black.withOpacity(0.3);
                                                }
                                              }()),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // end

            InkWell(
              onTap: () {
                createTrip(city, date, time, image);
              },
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 130, top: 14, right: 70, bottom: 10),
                  child: Text(
                    "DONE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
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
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
