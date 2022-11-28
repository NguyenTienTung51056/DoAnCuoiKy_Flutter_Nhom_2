import 'package:authentication_firebase/compoments/HeaderHome.dart';
import 'package:authentication_firebase/compoments/ItemCard.dart';
import 'package:authentication_firebase/services/apis_service.dart';
import 'package:authentication_firebase/utils/snackBar_helper.dart';
import 'package:flutter/material.dart';


class Guide extends StatefulWidget {
  final context;
  const Guide({Key? key,this.context}) : super(key: key);

  @override
  State<Guide> createState() => _GuideState();
}


class _GuideState extends State<Guide> {
bool isLoading = true;
List datas =[];
List _foundedUsers = [];
@override
void initState() {
  // TODO: implement initState
  super.initState();
  fetchTodos();
}
// Get all item
Future<void> fetchTodos() async {
  final res =await ApiService.fetchApis('guides');
  if (res !=null) {
    setState(() {
      datas = res;
      _foundedUsers=datas;
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderPage(size: size, onSearch: onSearch,page:'guide',context:this.context),
            SizedBox(height: 50,),
            Container(
                width: size.width*3.7,
                height: 650,
                child: GridView.builder(
                  itemCount: _foundedUsers.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.90),
                  itemBuilder: (context, index){
                    return ItemCard(data: _foundedUsers[index]);
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}
