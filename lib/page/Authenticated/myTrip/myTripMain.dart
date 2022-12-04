import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/myTrip/createnewtrip.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/myTrip/customshape.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/myTrip/mytrip.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/models/trip.dart';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

final trips = [
  Trip(
      city: "Da Nang, Vietnam",
      place: "Dragon Brige Trip",
      date: "Jan 30, 2020",
      time: "13:00 - 15:00",
      nameGuide: "Tuan Tran",
      guide: "images/myTrip/guide1.png",
      image: "images/myTrip/img7.png",
      finish: false),
  Trip(
      city: "Ha Noi, Vietnam",
      place: "Ho Guom",
      date: "Jan 30, 2020",
      time: "13:00 - 15:00",
      nameGuide: "Tuan Tran",
      guide: "images/myTrip/guide1.png",
      image: "images/myTrip/img6.png",
      finish: false)
];


class MyTripMain extends StatefulWidget {
  const MyTripMain({Key? key}) : super(key: key);

  @override
  State<MyTripMain> createState() => _MyTripMainState();
}

class _MyTripMainState extends State<MyTripMain> {

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
  static const IconData noiseControl =
  IconData(0xf07b6, fontFamily: 'MaterialIcons');
  static const IconData controlPoint =
  IconData(0xef85, fontFamily: 'MaterialIcons');
  static const IconData explore = IconData(0xf037, fontFamily: 'MaterialIcons');
  static const IconData markMap = IconData(0xe4c9, fontFamily: 'MaterialIcons');
  static const IconData chat = IconData(0xf019f, fontFamily: 'MaterialIcons');
  static const IconData notifications =
  IconData(0xe450, fontFamily: 'MaterialIcons');
  static const IconData account = IconData(0xf522, fontFamily: 'MaterialIcons');
  List<Trip> myTrips = trips;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Header
              Container(
                width: 500,
                height: 140,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/myTrip/img5.png"),
                      fit: BoxFit.cover,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                            const TextStyle(fontSize: 15, color: Colors.white),
                            secondDigitTextStyle:
                            const TextStyle(fontSize: 11, color: Colors.white),
                          ),
                          Row(
                            children: const [
                              Icon(signalCellular, size: 20, color: Colors.white),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(
                                wifi,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(batteryFull,
                                    size: 20, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.white.withOpacity(0.8),
                              )),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'My Trips',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 34,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // End header

              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 10, right: 16, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.green,
                                ),
                                width: 100,
                                height: 40,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 10, right: 7, bottom: 7),
                                  child: Text(
                                    'Current Trips',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                height: 40,
                                color: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 10, right: 7, bottom: 7),
                                  child: Text(
                                    'Next Trips',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                height: 40,
                                color: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 10, right: 7, bottom: 7),
                                  child: Text(
                                    'Past Trips',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                height: 40,
                                color: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      left: 7, top: 10, right: 7, bottom: 7),
                                  child: Text(
                                    'Wish List',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: 500,
                          width: 400,
                          child: ListView.builder(
                              itemCount: myTrips.length,
                              itemBuilder: (context,index){
                                final trip = myTrips[index];
                                return Column(
                                  children: [
                                    MyTrip(
                                      guide: trip.guide,
                                      nameGuide: trip.nameGuide,
                                      date: trip.date,
                                      time: trip.time,
                                      city: trip.city,
                                      image: trip.image,
                                      finish: trip.finish,
                                      place: trip.place,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              }
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // End body


              // Footer
              SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: ()=> Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context)=> const CreateTrip()
                            )
                        ),
                        child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey,
                            ),
                            child: const Icon(
                              controlPoint,
                              size: 45,
                              color: Colors.white,
                            )
                        ),
                      ),

                    ],
                  )
              ),
            ],
          ),
        )
    );
  }
}

