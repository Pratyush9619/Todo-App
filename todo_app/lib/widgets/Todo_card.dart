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
                    style: TextStyle(
                        fontSize: 18, fontWeight: (widget.ischecked == true) ? FontWeight.w300 : FontWeight.bold),
                  ),
                  Text(
                    giveDate(),
                    style: TextStyle(
                        fontSize: 16, fontWeight: (widget.ischecked == true) ? FontWeight.w300 : FontWeight.bold),
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
  
  String giveDate() {
    DateTime now = DateTime.now();
    String dt = "";
    dt += now.day.toString()+" ";
    final months = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'Jul',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };
    dt += months[now.month].toString()+" ";
    dt += now.year.toString()+"      ";
    dt += now.hour.toString() + ":" + now.minute.toString();
    return dt;
  }
}
