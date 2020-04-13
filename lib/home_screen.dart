import 'package:flutter/material.dart';
import 'package:suitmedia/event_screen.dart';
import 'package:suitmedia/guest_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override 
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String chooseEvent = 'Choose Event';
  String chooseGuest = 'Choose Guest';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _headerTitle(String title) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
    Detail chooseGuestObject = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => GuestPage()));
    chooseGuest = chooseGuestObject.firstName + ' ' + chooseGuestObject.lastName;
    
    // Scaffold.of(context).showSnackBar(SnackBar(content: Text(chooseGuest)));
    // Scaffold.of(context)
    //         ..removeCurrentSnackBar()
    //         ..showSnackBar(SnackBar(content: Text('$chooseGuest')));
    String chooseGuestId = device(chooseGuestObject.id);
    final snackBar = SnackBar(content: contentDialog(chooseGuestId));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Widget contentDialog(String value) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.phone_iphone),
          Text(value),
        ],
      ),
    );
  }

  String device(int value) {
    if (value%2 == 0) {
      return 'Blackberry';
    } else if (value%3 == 0){
      return 'Android';
    } else if (value%6 == 0) {
      return 'iOS';
    } else {
      return '';
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
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
    );
  }
}