import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/Bottom.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/tourApplication/chat/chat.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/compoments/tourApplication/notification/notifications.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/HomePageMain/HomePageMain.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/page/Authenticated/myTrip/myTripMain.dart';
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
  String pages = 'explore';

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


  onSearch(String search) {
    setState(() {
      _foundedUsers = datas
          .where(
              (data) => data['name'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }
  navigateOtherPage(String page){
    setState(() {
      pages = page;
    });
  }

  Widget _swichPage(size){
    if(pages=='explore'){
      return HomePageMain(onSearch: onSearch,foundUser: _foundedUsers,allPlaces: allPlaces,size: size,);
    }

    if(pages=='myTrip'){
      return MyTripMain();
    }

    if(pages=='messages'){
      return Chat();
    }

    if(pages=='notification'){
      return Notifications();
    }

    return Container();
  }


  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _swichPage(size),
      bottomNavigationBar: Bottom(navigateToPage: navigateOtherPage,pages: pages,)
    );
  }
}
