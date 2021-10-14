class Event {
  String name;
  String schedule;
  String tagColor;
  String date;

  Event({
    required this.name,
    required this.schedule,
    required this.tagColor,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['schedule'] = schedule;
    data['tagColor'] = tagColor;
    data['date'] = date;
    return data;
  }
}
