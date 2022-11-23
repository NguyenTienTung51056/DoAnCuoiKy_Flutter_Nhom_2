import 'package:authentication_firebase/compoments/todo_card.dart';
import 'package:authentication_firebase/utils/snackBar_helper.dart';
import 'package:authentication_firebase/page/Authenticated/_Add_todo_page.dart';
import 'package:authentication_firebase/services/todo_services.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodos();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          'To do list', 
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchTodos,
          child: Visibility(
              visible: items.isEmpty,
              child: Center(child: Text("No ToDo Item",style: Theme.of(context).textTheme.headline3,),),
              replacement: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index] as Map;
                return TodoCard(
                    index: index,
                    item: item,
                    navigateEdit: navigateToEditPage,
                    deleteById: deleteById
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAddPage, label: Text("Add Todo")),
    );
  }

  Future<void>  navigateToEditPage(Map item) async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodo(todo: item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodos();
  }


   Future<void> navigateToAddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddTodo(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodos();
  }

  //Delete Item
  Future<void> deleteById(String id) async {
       final isSuccess = await TodoService.deleteById(id);
       if(isSuccess){
        final fitlered = items = items.where((element)=> element['id']!=id).toList();
         setState(() {
            items = fitlered;
         });
       }else{
         showSuccessError(context,message:"Delete Fail'");
       }
  }

  // Get all item
  Future<void> fetchTodos() async {
      final res =await TodoService.fetchTodos();

    if (res !=null) {
      setState(() {
        items = res;
      });
    } else {
      showSuccessError(context,message:"Somethings Went Wrong");
    }
    setState(() {
      isLoading = false;
    });
  }




}
