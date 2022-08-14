class Task{
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  int? remind;
  int? color;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.remind,
    this.color,
  });

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    remind = json['remind'];
    color = json['color'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.id;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['remind'] = this.remind;
    data['color'] = this.color;
    return data;
  }
}