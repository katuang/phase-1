class Page {

  final int page;
  final int perPage;
  final int total;
  final int totalPage;
  final List<Guest> guest;

  Page({this.page, this.perPage, this.total, this.totalPage, this.guest});

  factory Page.fromJson(Map<String, dynamic> json) {

    var list = json['data'] as List;
      
    List<Guest> guestList = list.map((i) => Guest.fromJson(i)).toList();
    return Page(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPage: json['total_page'],
      guest: guestList,
    );  
  }
}

class Guest {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Guest({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}