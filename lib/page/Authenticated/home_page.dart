import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/Bottom.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/ButtonWithCustom.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/HeaderHome.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/ItemCard.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/homeservice.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/guides.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/tours.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/services/apis_service.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/utils/snackBar_helper.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}



class _HomePage extends State<HomePage> {
  bool isLoading = true;

  List allPlaces = [];
  List datas = [];
  List _foundedUsers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodos();
    fetchTodos2();
  }
// Get all item
  Future<void> fetchTodos() async {
    final res =await ApiService.fetchApis('guides');
    if (res !=null) {
      setState(() {
        datas = res;
        _foundedUsers = datas;
      });
    } else {
      showSuccessError(context,message:"Somethings Went Wrong");
    }
    setState(() {
      isLoading = false;
    });
  }

  // Get all item
  Future<void> fetchTodos2() async {
    final res =await ApiService.fetchApis('tours');
    if (res !=null) {
      setState(() {
        allPlaces = res;
      });
    } else {
      showSuccessError(context,message:"Somethings Went Wrong");
    }
    setState(() {
      isLoading = false;
    });
  }

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



  onSearch(String search) {
    setState(() {
      _foundedUsers = datas
          .where(
              (data) => data['name'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPage(size:size,onSearch:onSearch,page: 'home'),
            SizedBox(height: 30,),
            ButtonWithCustome(title:'Top Journeys',press:navigateToTourPage,),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: size.width*4.8,
                    height: 280,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.builder(
                      itemCount: allPlaces.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 8, childAspectRatio: 1.3),
                     itemBuilder: (context, index) {
                       final place = allPlaces[index];
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
                width: size.width*3.7,
                height: 650,
                child: GridView.builder(
                  itemCount: _foundedUsers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.90),
                  itemBuilder: (context, index){
                    final guide = _foundedUsers[index];
                    return ItemCard(
                     data: guide,
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
