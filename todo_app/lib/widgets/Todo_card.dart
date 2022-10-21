import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/db_model.dart';
import 'package:todo_app/models/todo_model.dart';

class TodoCard extends StatefulWidget {
  final int id;
  final String title;
  final DateTime creationdate;
  bool ischecked = false;
  final Function insertfunction; // it will handle the changes in checkbox
  final Function deletefunction; // it will handle the changes of delete button

  TodoCard(
      {Key? key,
      required this.id,
      required this.title,
      required this.creationdate,
      required this.insertfunction,
      required this.deletefunction,
      required this.ischecked})
      : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    var secondtodo = Todo(
        id: widget.id,
        title: widget.title,
        creationdate: widget.creationdate,
        ischecked: widget.ischecked);
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Checkbox(
                value: widget.ischecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.ischecked = value!;
                  });

                  secondtodo.ischecked = value!;
                  widget.insertfunction(secondtodo);
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy  hh: mm aa')
                        .format(widget.creationdate),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  widget.deletefunction(secondtodo);
                },
                icon: Icon(Icons.delete),
                alignment: Alignment.centerLeft)
          ],
        ),
      ),
    );
  }
}
