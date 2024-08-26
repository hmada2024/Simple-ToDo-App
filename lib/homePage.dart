import 'package:flutter/material.dart';
import 'package:simple_todo/toDoListPage.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["learn Dart", false],
    ["learn Flutter", false],
    ["learn Firebese", false],
    ["learn DataBase", false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Simple Todo"),
        backgroundColor: const Color.fromARGB(255, 2, 72, 130),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return ToDoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (contex) => {deleteTask(index)},
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Add : What you want to do.",
                      filled: true,
                      fillColor: Color.fromARGB(255, 85, 146, 215),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    )),
              ),
            ),
            FloatingActionButton(
                onPressed: () {
                  saveNewTask();
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

















/*class HomePage extends StatefulWidget {
  HomePage({super.key,})
 

;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["learn Dart", false],
    ["learn OOP", false],
    ["learn Flutter", false],
    ["learn Firebese", false],
    ["learn DataBase", false],
    ["learn English", false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] =  toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 2, 72, 130),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 239, 233, 147),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Simple Todo"),
          backgroundColor: const Color.fromARGB(255, 2, 72, 130),
          foregroundColor: Colors.white,
        ),
        body: ListView.builder(
            itemCount: toDoList.length,
            itemBuilder: (BuildContext context, index) {
              return TodoList(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(index),
              );
            }));
  }
}*/
