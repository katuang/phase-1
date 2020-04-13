import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {

  @override 
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  // String _inputText;
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  bool _validate = false;

  fetchGuest() async {
  final response = await http.get('https://reqres.in/api/users');

  if (response.statusCode == 200) {
    var listResponse = convert.json.decode(response.body);
    return listResponse['avatar'];
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget textInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
      child: TextField(
        // maxLines: 1,
        // autofocus: false,
        decoration: InputDecoration(
          hintText: 'Type Name Here',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          errorText: _validate ? 'Name Can\'t Be Empty' : null,
          // galabelText: 'Name'
        ),
        // validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        // onSaved: (value) => _inputText = value.trim(),
        controller: myController,
        // onChanged: (text) {
        //   _inputText = text;
        // },
      ),
    );
  }

  Widget nextButton() {
    return InkWell(
      onTap: () {
        
        setState(() {
          myController.text.isEmpty ? _validate = true : _validate = false;
          !_validate ? Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(title: myController.text))) : _validate = true;
        });
        
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue,
        ),
        
        child: Text('Next'),
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          // decoration: BoxDecoration(
          //   color: Colors.yellow,
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              textInput(),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
}