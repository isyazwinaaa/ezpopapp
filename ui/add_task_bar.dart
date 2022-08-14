import 'package:ezpop/controllers/task_controller.dart';
import 'package:ezpop/models/task.dart';
import 'package:ezpop/ui/theme.dart';
import 'package:ezpop/ui/widget/button.dart';
import 'package:ezpop/ui/widget/input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  int _selectedRemind = 1;
  List<int> remindList = [
    1,
    2,
    3,
    4,
    5,
  ];

  int _selectedColor=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Product",
                style: headingStyle,
              ),
              MyInputField(title: "Product Name", hint: "Enter the product name", controller: _titleController,),
              MyInputField(title: "Note", hint: "Enter your note", controller: _noteController,),
              MyInputField(title: "Expired Date", hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon: const Icon(Icons.calendar_today_outlined,
                color: Colors.grey
                ),
                onPressed: () {
                  print("Hi there");
                  _getDateFromUser();
                },
              ),
              ),
              MyInputField(title: "Remind", hint: "$_selectedRemind days before",
              widget: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down,
                color: Colors.grey,

                ),
                iconSize: 32,
                elevation: 4,
                style: subTitleStyle,
                underline: Container(height: 0),
                onChanged: (String? newValue){
                  setState(() {
                    _selectedRemind = int.parse(newValue!);
                  });
                },
                items: remindList.map<DropdownMenuItem<String>>((int value){
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                },
                ).toList(),
              ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  MyButton(label: "Add Product", onTap: ()=>_validateDate())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _validateDate(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty) {
      _addTaskToDb();
      Get.back();
    }else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("Required", "All fields are required !",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      icon: const Icon(Icons.warning_amber_rounded,
      color: Colors.red
      )
      );
    }
  }

  _addTaskToDb() async{
  int value = await _taskController.addTask(
      task:Task(
        title: _titleController.text,
        note: _noteController.text,
        date: DateFormat.yMd().format(_selectedDate),
        remind: _selectedRemind,
        color: _selectedColor,
        isCompleted: 0,
      ),
    );
  print("My id is "+"$value");
  }

  _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
          style: titleStyle,
        ),
        const SizedBox(height: 8.0),
        Wrap(
          children: List<Widget>.generate(
              3,
                  (int index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _selectedColor=index;
                      print("$index");
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: index==0?purpleClr:index==1?tealClr:pinkClr,
                      child: _selectedColor==index?const Icon(Icons.done,
                        color: Colors.white,
                        size: 16,
                      ): Container(),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black
        ),
      ),
      actions: const [
        Icon(Icons.person,
          size: 20,
        ),
        SizedBox(width: 20,),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050)
    );

    if(_pickerDate!=null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    }else{
      print("It's null or something is wrong");
    }
  }
}





