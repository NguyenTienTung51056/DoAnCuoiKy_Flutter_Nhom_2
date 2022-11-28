import 'package:DoAnCuoiKy_Flutter_Nhom_2/services/todo_services.dart';
import 'package:flutter/material.dart';
import 'package:DoAnCuoiKy_Flutter_Nhom_2/utils/snackBar_helper.dart';

class AddTodo extends StatefulWidget {
  final Map? todo;
  const AddTodo({Key? key, this.todo,}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final todo = widget.todo;
    if (widget.todo != null) {
      isEdit = true;
      final title = todo?['title'];
      final desc = todo?['desc'];
      titleController.text = title;
      descriptionController.text = desc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00000059),
        title: Center(
            child: Text(
          isEdit ? 'Edit Todo ' : 'Add Todo',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
                onPressed: isEdit ? updateData : submitData,
                child: Text(isEdit ? 'Edit ' : 'Add')),
          ),
        ],
      ),
    );
  }

  Future<void> updateData() async {
    // lấy dữ liệu từ form input
    final todo = widget.todo;
    final id = todo?['id'];
    final isCompleted = todo?['is_completed'];
    final title = titleController.text;
    final desc = descriptionController.text;
    final body = {
      "title": title,
      "desc": desc,
      "is_completed": false,
    };
    final isSuccess = await TodoService.updateTodo(id, body);
    if (title != '' && desc != '') {
      // hiện success hoặc fail message trong status
      if (isSuccess) {

        showSuccessMessage(context,message:'Updated Success');
      } else {
        showSuccessError(context,message:'Update Failed');
      }
    } else {
      showSuccessError(context,message:'Please, enter full feild');
    }
  }

  Future<void> submitData() async {
    // lấy dữ liệu từ form input
    final title = titleController.text;
    final desc = descriptionController.text;
    final body = {
      "title": title,
      "desc": desc,
      "is_completed": false,
    };
    if (title != '' && desc != '') {
      // gửi dữ liệu  đến server
      final isSuccess = await TodoService.addTodo(body);
      // hiện success hoặc fail message trong status
      if (isSuccess) {
        titleController.text = '';
        descriptionController.text = '';
        showSuccessMessage(context,message:'Created Success');
      } else {
        showSuccessError(context,message:'Create Failed');
      }
    } else {
      showSuccessError(context,message:'Please, enter full feild');
    }
  }

}
