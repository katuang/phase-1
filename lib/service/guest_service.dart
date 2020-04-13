import 'package:suitmedia/model/guest_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class GuestService {

  Future<Page> fetchPage() async {
  final response = await http.get('https://reqres.in/api/users');
  
    if(response.statusCode == 200) {
      return Page.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load Data');
    }  
  }

}

