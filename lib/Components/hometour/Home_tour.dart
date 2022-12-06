
import 'package:flutter/material.dart';
import 'package:tour_application_1/Components/hometour/Location_tour.dart';

class HomeTour extends StatefulWidget {
  const HomeTour({Key? key}) : super(key: key);

  @override
  State<HomeTour> createState() => _HomeTourState();
}

class _HomeTourState extends State<HomeTour> {
  
    static const IconData navigate_before =
  IconData(0xe41c, fontFamily: 'MaterialIcons', matchTextDirection: true);
  @override
  Widget build(BuildContext context) {
    return  Stack(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('img/tour.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 10,
              child: Row(
                children: [
                  Image.asset(
                    'img/Battery.png',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'img/Wi-Fi.png',
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'img/Combined.png',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 30,
                left: 10,
                child: Icon(
                  navigate_before,
                  size: 50,
                  color: Colors.white,
                )),
            Positioned(
              top: 90,
              left: 30,
              width: 400,
              child: Text(
                'Plenty of amazing of tours are waiting for you',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ItemLocation()
            
          ],
    );
    
  }
}