import 'dart:js';

import 'package:flutter/material.dart';



class HeaderPage extends StatelessWidget {
  final String page;
  final size;
  final Function(String) onSearch;
  final context;
  const HeaderPage({Key? key, required  this.onSearch, required  this.size, required  this.page,this.context}) : super(key: key);


  Widget _MainInTopInHome(){
    return Row(
      children: [
        Text('Explore',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35)),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  Text(
                    "Da Nang",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.cloud,
                    color: Colors.grey,
                    size: 35,
                  ),
                  Text(
                    "26'C",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 35),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _MainInTopInGuide(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: 50,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Book your own private local \nGuide and explore the city",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: (page=='home'?AssetImage('assets/images/danang.jpg'):AssetImage('assets/images/backgroundTop.png')),
                  fit: BoxFit.cover)),
          child:(page=='home' ? _MainInTopInHome(): _MainInTopInGuide())
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35),
            margin: EdgeInsets.symmetric(horizontal: 35),
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black12
                  ),
                ]),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  color: Colors.grey[600],
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) => onSearch(value),
                    decoration: InputDecoration(
                      hintText: "Hi, where do you want to explore? ",
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}


