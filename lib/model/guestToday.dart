// 新客
class Guest {
  int id;
  String img;
  String reachTime;
  String arrivalTime;

  Guest(this.id, this.img, this.reachTime, this.arrivalTime);

  Guest.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        img = json['img'],
        arrivalTime = json['arrivalTime'],
        reachTime = json['reachTime'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'img': img,
        'reachTime': reachTime,
        'arrivalTime': arrivalTime
      };
}

// 新客列表
class GuestToday {
  List<Guest> datalist;
  int people;

  GuestToday({this.datalist, this.people});

  GuestToday.fromJson(Map<String, dynamic> json)
      : datalist = json['datalist'].map((i)=> Guest.fromJson(i)).toList(),
        people = json['people'];

  Map<String, dynamic> toJson() => {
    'datalist': datalist,
    'people': people,
  };
}

