import 'package:authentication_firebase/compoments/HeaderHome.dart';
import 'package:authentication_firebase/services/apis_service.dart';
import 'package:authentication_firebase/utils/snackBar_helper.dart';
import 'package:flutter/material.dart';

import '../../compoments/homeservice.dart';

class Tour extends StatefulWidget {
  final context;
  const Tour({Key? key,this.context}) : super(key: key);

  @override
  State<Tour> createState() => _TourState();
}

class _TourState extends State<Tour> {
  bool isLoading = true;
  List datas =[];
  List _foundedPaces = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodos();
  }
// Get all item
  Future<void> fetchTodos() async {
    final res =await ApiService.fetchApis('tours');
    if (res !=null) {
      setState(() {
        datas = res;
        _foundedPaces=datas;
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
      _foundedPaces = datas
          .where(
              (data) => data['title'].toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPage(size: size, onSearch: onSearch,page:'tour',context: this.context,),
            SizedBox(height: 50,),
            Container(
                width: size.width*3.7,
                height: 650,
                child:  ListView.builder(
                  itemCount: _foundedPaces.length,
                  itemBuilder: (context, index) {
                    final place = _foundedPaces[index];
                    return Column(
                      children: [
                        HomeService(
                         data: place,
                          page:'tour'
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
