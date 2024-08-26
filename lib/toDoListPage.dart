import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(35),
            backgroundColor: Colors.red,
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 2, 72, 130),
              borderRadius: BorderRadius.circular(35)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              Text(taskName,
                  style: TextStyle(
                      color: (Colors.white),
                      fontSize: 15,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

/*class TodoList extends StatefulWidget {
  const TodoList(
      {super.key,
      
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged
 
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 72, 130),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(
              value: ,
              onChanged: ,
              checkColor: Colors.black,
              activeColor: Colors.white,
            ),
            Text(
            taskName,[index][0],
              style: const TextStyle(color: (Colors.white), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

  @override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }*/
