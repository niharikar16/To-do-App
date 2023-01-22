import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:todo/database.dart';
import 'package:todo/todo_tile.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    // if this is the first time opening the app, then create the default data
    if(_myBox.get("TODOLIST") == null)
      {
        db.createInitialData();
      }
    else {

        db.loadData();
      }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();


//check box changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //save new task
  void saveNewTask()
  {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //creating new task
  void createNewTask()
  {
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        //this dismiss the dialogue box
        onCancel: () => Navigator.of(context).pop(),
      );
    },
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAE4D9),
      appBar: AppBar(title:
      Center(child:
      Text('TO - DO',
          style: GoogleFonts.josefinSans(
              color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold))),
      elevation: 0,),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return
            ToDoList(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunc: (context) => deleteTask(index),
            );
        }

        ),

    );
  }
}
