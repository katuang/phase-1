import 'package:flutter/material.dart';
import 'package:suitmedia/model/event_model.dart';
import 'package:suitmedia/service/event_service.dart';
import 'package:jiffy/jiffy.dart';

class EventPage extends StatefulWidget {

  @override 
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  Future<List<Event>> futureEvent;

  @override
  void initState() {
    super.initState();
    futureEvent = EventService().fetchEvents();
  }

  Widget _buildBody(List<Event> events) {
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pop(events[index].name);
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
                imageContainer(events[index].image),
                titleContainer(events[index].name, Jiffy(events[index].date).yMMMMd),
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

  Widget titleContainer(String header, String body) {
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
      body: Center(
        child: FutureBuilder(
          future: futureEvent,
          builder: (context, snapshot) {
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? _buildBody(snapshot.data) : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}