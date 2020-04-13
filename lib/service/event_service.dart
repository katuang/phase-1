import 'package:suitmedia/model/event_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class EventService {

  Future<List<Event>> fetchEvents() async {
    final response = await rootBundle.loadString('assets/events.json');

    return compute(parseEvents, response);
  }

}

List<Event> parseEvents(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Event>((json) => Event.fromJson(json)).toList();
  }