import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/ButtonWithCustom.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/HeaderHome.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/ItemCard.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/homeservice.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/guides.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/tours.dart';
import 'package:flutter/material.dart';


class HomePageMain extends StatefulWidget {
  final size;
  final Function(String) onSearch;
  final allPlaces;
  final foundUser;
  const HomePageMain({Key? key,this.size,required this.onSearch,this.allPlaces,this.foundUser}) : super(key: key);

  @override
  State<HomePageMain> createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  bool isLoading = true;

  Future<void> navigateToGuidePage() async {
    final route = MaterialPageRoute(
      builder: (context) => Guide(context:context),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
  }

  Future<void> navigateToTourPage() async {
    final route = MaterialPageRoute(
      builder: (context) => Tour(context:context),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderPage(size:widget.size,onSearch:widget.onSearch,page: 'home'),
          SizedBox(height: 30,),
          ButtonWithCustome(title:'Top Journeys',press:navigateToTourPage,),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                    width: widget.size.width*4.8,
                    height: 280,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.builder(
                      itemCount: widget.allPlaces.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8, childAspectRatio: 1.3),
                      itemBuilder: (context, index) {
                        final place = widget.allPlaces[index];
                        return HomeService(
                          data: place,
                          page: 'home',
                        );
                      },
                    )
                ),
              ],
            ),
          ),
          ButtonWithCustome(title:'Best Guides',press:navigateToGuidePage,),
          SizedBox(height: 20,),
          Container(
              width: widget.size.width*3.7,
              height: 650,
              child: GridView.builder(
                itemCount: widget.foundUser.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.90),
                itemBuilder: (context, index){
                  final guide = widget.foundUser[index];
                  return ItemCard(
                    data: guide,
                  );
                },
              )
          ),
        ],
      ),
    );
  }
}
