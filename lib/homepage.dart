import 'package:flutter/material.dart';
import 'package:suitmedia/eventpage.dart';
import 'package:suitmedia/guestpage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String chooseEvent = 'Choose Event';
  String chooseGuest = 'Choose Guest';

  Widget _headerTitle(String title) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Name: '),
          Text(title),
        ],
      ),
    );
  }

  Widget _eventButton(String title) {
    return InkWell(
      onTap: () {
        eventSelection(context);
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
        child: Text(title),
      ),
    );
  }

  Widget _guestButton(String title) {
    return InkWell(
      onTap: () {
        guestSelection(context);
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
        child: Text(title),
      ),
    );
  }

  eventSelection(BuildContext context) async{
    chooseEvent = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => EventPage()));
  }

  guestSelection(BuildContext context) async{
    chooseGuest = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuestPage()));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(chooseGuest)));
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
              _headerTitle(widget.title),
              _eventButton(chooseEvent),
              _guestButton(chooseGuest),
            ],
          ),
        ),
      ),
    );
  }
}