import 'package:flutter/material.dart';

class ItemLocation extends StatefulWidget {
  const ItemLocation({Key? key}) : super(key: key);

  @override
  State<ItemLocation> createState() => _ItemLocationState();
}

class _ItemLocationState extends State<ItemLocation> {
  final List<Map<String, dynamic>> _allLocation = [
    {
      "id": 1,
      "name": "Da Nang - Ba Na - Hoi An",
      "price": "\$400.00",
      "img": "img/Restaurant.png",
      "icon": Icons.favorite
    },
    {
      "id": 2,
      "name": "Hanoi - Ha Long Bay",
      "price": "\$600.00",
      "img": "img/halong.png",
      "icon": Icons.favorite_border
    },
    {
      "id": 3,
      "name": "Melbourne - Sydney",
      "price": "\$400.00",
      "img": "img/sigapor.png",
      "icon": Icons.favorite
    },
    {
      "id": 1,
      "name": "Da Nang - Ba Na - Hoi An",
      "price": "\$400.00",
      "img": "img/Restaurant.png",
      "icon": Icons.favorite_border
    },
    {
      "id": 2,
      "name": "Hanoi - Ha Long Bay",
      "price": "\$600.00",
      "img": "img/halong.png",
      "icon": Icons.favorite
    },
    {
      "id": 3,
      "name": "Melbourne - Sydney",
      "price": "\$400.00",
      "img": "img/sigapor.png",
      "icon": Icons.favorite
    },
  ];

  List<Map<String, dynamic>> _foundLocation = [];// đây là list chứa các location tìm được theo từ khóa
  @override
  initState() {//initState() được gọi khi widget được khởi tạo lần đầu tiên
    //lúc đầu hiện tất cả các địa điểm
    _foundLocation = _allLocation;// đây là list chứa các location tìm được theo từ khóa
    super.initState();
  }

  //hàm tìm kiếm
  void _searchLocation(String value) {
    List<Map<String, dynamic>> _searchResult = [];
    if (value.isEmpty) {
      //nếu không nhập gì thì hiện tất cả các địa điểm
      _searchResult = _allLocation;
    } else {
      //nếu nhập thì tìm kiếm,chuyển về chữ thường
      _searchResult = _allLocation
          .where((element) =>
              element["name"].toString().toLowerCase().contains(value))
          .toList();
      //chuyển về chữ thường để so sánh
    }
    //setState để cập nhật lại giao diện
    setState(() {
      _foundLocation = _searchResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180),
      child: Column(children: [
        SizedBox(
          width: 400,
          child:  TextField(
          onChanged: (value) {
            _searchLocation(value);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            hintText: 'Hi, where do you want to explore? ',
            hintStyle: TextStyle(fontSize: 18.0),
            prefixIcon: Icon(
              Icons.search,
              size: 16.0,
            ),
            filled: true,
          ),
        ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: _foundLocation.length,
            itemBuilder: (context, index) {
              return Container(
                height: 231,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.asset(
                          _foundLocation[index]["img"].toString(),
                          height: 135,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 100,
                          left: 16,
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text('1247 likes',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ))
                            ],
                          )),
                      Positioned(
                        top: 140,
                        left: 14,
                        right: 14,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                _foundLocation[index]["name"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.grey,
                                size: 15,
                              ),
                              Text(
                                'Jan 30, 2020',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                                size: 15,
                              ),
                              Text(
                                '3 Days',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                      Positioned(
                        right: 14,
                        top: 140,
                        child: Icon(
                          _foundLocation[index]["icon"],
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                      Positioned(
                          top: 180,
                          right: 14,
                          child: Text(
                            _foundLocation[index]["price"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
