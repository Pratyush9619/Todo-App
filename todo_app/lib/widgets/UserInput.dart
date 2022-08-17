import 'package:flutter/material.dart';
import 'package:todo_app/models/db_model.dart';
import 'package:todo_app/models/todo_model.dart';

class UserInput extends StatelessWidget {
  TextEditingController textcontroller = TextEditingController();

  Function insertfunction; // this will receive additem function
  UserInput({Key? key, required this.insertfunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextFormField(
                  controller: textcontroller,
                  decoration: InputDecoration(
                    hintText: "Add New Todo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
              onPressed: () {
                var items = Todo(
                    title: textcontroller.text,
                    creationdate: DateTime.now(),
                    ischecked: false);

                insertfunction(items);
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
