import 'package:hive/hive.dart';

class ToDoDataBase{
  List toDoList = [];

   final _myBox = Hive.box('myBox');

   void createInitialData()
   {
     toDoList =[
       ["make up", false],
       ["exercise", false]

     ];
   }

   //load the database
  void loadData()
  {
    toDoList = _myBox.get("TODOLIST");
  }


  //update the database
  void updateData()
  {
    _myBox.put("TODOLIST", toDoList);
  }

}