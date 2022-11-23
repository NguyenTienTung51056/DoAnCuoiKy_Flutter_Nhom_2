import 'package:authentication_firebase/compoments/Bottom.dart';
import 'package:authentication_firebase/compoments/ButtonWithCustom.dart';
import 'package:authentication_firebase/compoments/HeaderHome.dart';
import 'package:authentication_firebase/compoments/ItemCard.dart';
import 'package:authentication_firebase/compoments/homeservice.dart';
import 'package:authentication_firebase/models/guide.dart';
import 'package:authentication_firebase/models/tour.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

final guides = [
  Guide(
    name: "Tuan Tran",
    address: "Danang, Vietnam",
    image: "images/man.png",
    star: 3
  ),
  Guide(
    name: "Emmy",
    address: "Hanoi, Vietnam",
    image: "images/img.png",
      star: 4
  ),
  Guide(
    name: "Linh Hana",
    address: "Danang, Vietnam",
    image: "images/aohong.jpg",
      star: 5
  ),
  Guide(
    name: "Khai Ho",
    address: "Ho Chi Minh, Vietnam",
    image: "images/deokinh.jpg", star: 2
  ),
];




final places = [
  Place(
    title: "Da Nang - Ba Na - Hoi An",
    price: "\$400.00",
    image: "images/img2.png",
  ),
  Place(
    title: "Melbourne - Sydney",
    price: "\$600.00",
    image: "images/img3.png",
  ),
  Place(
    title: "Hanoi - Ha Long Bay",
    price: "\$300.00",
    image: "images/img4.png",
  ),
  Place(
    title: "Da Nang - Ba Na - Hoi An",
    price: "\$400.00",
    image: "images/img2.png",
  ),
  Place(
    title: "Melbourne - Sydney",
    price: "\$600.00",
    image: "images/img3.png",
  ),
  Place(
    title: "Hanoi - Ha Long Bay",
    price: "\$300.00",
    image: "images/img4.png",
  ),
];

class _HomePage extends State<HomePage> {
  bool isLoading = true;

  List<Guide> allGuides = guides;
  List<Place> allPlaces = places;
  List<Guide> _foundedUsers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _foundedUsers = allGuides;
    });
  }

  onSearch(String search) {
    setState(() {
      _foundedUsers = allGuides
          .where(
              (data) => data.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
      });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPage(size:size,onSearch:onSearch),
            SizedBox(height: 30,),
            ButtonWithCustome(title:'Top Journeys',press:(){},),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: size.width*3.7,
                    height: 280,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.builder(
                      itemCount: allPlaces.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: allPlaces.length, childAspectRatio: 1.3),
                     itemBuilder: (context, index) {
                       final place = allPlaces[index];
                      return HomeService(
                        title: place.title,
                        price: place.price,
                        image: place.image,
                      );
                     },
                    )
                  ),
                ],
              ),
            ),
            ButtonWithCustome(title:'Best Guides',press:(){},),
            SizedBox(height: 20,),
            Container(
                width: size.width*3.7,
                height: 650,
                child: GridView.builder(
                  itemCount: _foundedUsers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.90),
                  itemBuilder: (context, index){
                    final guide = _foundedUsers[index];
                    return ItemCard(
                      name: guide.name,
                      image: guide.image,
                      adress: guide.address,
                      star: guide.star
                    );
                  },
                )
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom()
    );
  }
}
