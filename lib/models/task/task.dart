class Task{
  final String id;
  final String task;
  final String time;
  final bool completed;

  Task({required this.id,
    required this.task,
    required this.time,
    required this.completed});

  Map<String,dynamic> toMap() => {
    'id':id,
    'task':task,
    'time':time,
    'completed':completed,
  };

 factory Task.fromMap(Map map) => Task(
    id:map['id'],
   task:map['task'],
   time:map['time'],
   completed:map['completed'],
  );



}