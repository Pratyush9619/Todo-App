import 'package:flutter/material.dart';
import 'package:todo_app/models/db_model.dart';
import 'package:todo_app/widgets/Todo_card.dart';

class TodoList extends StatelessWidget {
  Function insertfunction;
  Function deletefunction;
  TodoList(
      {required this.insertfunction, required this.deletefunction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: FutureBuilder(
            future: ConnectDatabase.instance.getTodo(),
            initialData: const [],
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              var values = snapshot.data;
              var datalength = values!.length;

              return datalength == 0
                  ? const Center(
                      child: Text(
                        "Data not found ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  : ListView.builder(
                      itemCount: datalength,
                      itemBuilder: (context, i) => TodoCard(
                            id: values[i].id,
                            title: values[i].title,
                            creationdate: values[i].creationdate,
                            ischecked: values[i].ischecked,
                            insertfunction: insertfunction,
                            deletefunction: deletefunction,
                          ));
            }));
  }
}
