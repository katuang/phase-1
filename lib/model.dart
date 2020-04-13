import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';

Future<Page> fetchPage() async {
  final response = await http.get('https://reqres.in/api/users');
  
  return Page.fromJson(jsonDecode(response.body));
  
}

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

Future<List<Event>> fetchEvents() async {
  final response = await rootBundle.loadString('assets/events.json');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseEvents, response);
}

// A function that converts a response body into a List<Photo>.
List<Event> parseEvents(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}

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