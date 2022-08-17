class Todo {
  int? id;
  final String? title;
  final DateTime creationdate;
  bool ischecked;

  Todo({
    this.id,
    required this.title,
    required this.creationdate,
    required this.ischecked,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationdate': creationdate.toString(), // sqflite not accept date format
      'ischecked': ischecked ? 1 : 0, //  sqflite not receive boolean value
    };
  }

  @override
  String toString() {
    return "Todo(id: $id, title: $title, creationdate: $creationdate, ischecked: $ischecked)";
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map['id'],
        title: map['title'],
        creationdate: map['creationdate'],
        ischecked: map['ischecked']);
  }
}
