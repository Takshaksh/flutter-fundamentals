class Todo{
  final int? id;
  final String title;
  final bool status;

  Todo({
    this.id,
    required this.title,
    this.status = false,
  });

  Map<String, dynamic> toMap(){
    var map = <String, Object?>{
      'title': title,
      'status': status == true ? 1 : 0
    };

    if(id != null){
      map['id'] = id;
    }

    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map){
    return Todo(
      id: map['id'],
      title: map['title'],
      status: map['status'] == 1

    );

  }

  @override
  String toString() {
    return "Dog{ id: $id, title: $title, status: $status}";
  }
}