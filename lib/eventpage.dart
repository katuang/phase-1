import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {

  @override 
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  var eventData = [
    {
      'id': 1,
      'name': 'Event 1',
      'date': 'April 4, 2020',
      'image': 'images/firstImage.jpg',
    },
    {
      'id': 2,
      'name': 'Event 2',
      'date': 'April 5, 2020',
      'image': 'images/secondImage.jpg',
    },
    {
      'id': 3,
      'name': 'Event 3',
      'date': 'April 6, 2020',
      'image': 'images/thirdImage.jpg',
    },
    {
      'id': 4,
      'name': 'Event 4',
      'date': 'April 7, 2020',
      'image': 'images/fourthImage.jpg',
    },
    {
      'id': 5,
      'name': 'Event 5',
      'date': 'April 8, 2020',
      'image': 'images/fifthImage.jpg',
    },
    {
      'id': 6,
      'name': 'Event 6',
      'date': 'April 9, 2020',
      'image': 'images/sixthImage.jpg',
    },

  ];
  Widget _buildBody() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, i) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pop(eventData[i]['name']);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3.0, 
                  color: Colors.grey,
                  ),                  
              ),
            ),
            child: Row(
              children: <Widget>[
                imageContainer(eventData[i]['image']),
                titleContainer(eventData[i]['name'], eventData[i]['date']),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget imageContainer(String path) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(70),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        // borderRadius: BorderRadius.circular(5),
        
      ),
    );
  }

  Widget titleContainer(String header, body) {
    return Expanded(
      child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(header),
          Text(body),
        ],
      ),
    ),
    );
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EVENTS'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
    );
  }
}