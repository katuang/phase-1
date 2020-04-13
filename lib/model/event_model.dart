class Event {
  final int id;
  final String name;
  final String date;
  final String image;

  Event({this.id, this.name, this.date, this.image});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      date: json['date'],
      image: json['image']
    );
  }
}