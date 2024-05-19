class Task{
  String title;
  bool complete;
  String time;

  Task({required this.title, required this.complete,required this.time});

  toJson() {
    return {"title": title, "complete": complete,"time":time};
  }

  fromJson(jsonData) {
    return Task(title: jsonData["title"], complete: jsonData["complete"],time: jsonData["time"]);
  }

  Task.fromMap(Map map)
      : this.title = map['title'],
        this.complete = map['complete'],
        this.time = map['time'];

  Map toMap() {
    return {'title': this.title, 'complete': this.complete, 'time': this.time};
  }
}