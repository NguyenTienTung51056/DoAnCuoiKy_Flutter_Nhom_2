import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ItemCard extends StatelessWidget {
  final Map data;
  const ItemCard({Key?key, required this.data}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage('${data['avatar']}'),fit: BoxFit.cover
          ),),
          child: Stack(
            children: [
              Positioned(
                top: 135,
                left: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Column(
                    children: [
                      Expanded(
                        child: data['star']> 0
                            ? GridView.builder(
                          itemCount: data['star'],
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:  data['star'], childAspectRatio: 1),
                          itemBuilder: (context, index) =>
                                   SvgPicture.asset("assets/icons/star.svg"),
                        )
                            :SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 170,
                  left: 10,
                  child: Text(
                    "${data['Review']} Reviews",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 25),
          child: Column(
            children: [
              Container(
                child: Text(
                  "${data['name']}",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Container(
            width: 188,
            child: Row(
              children: [
                Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                ),
                Container(
                  child: Text(
                    "${data['address']}",
                    style: TextStyle(fontSize: 17, color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}



