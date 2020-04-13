import 'package:flutter/material.dart';
import 'package:suitmedia/model.dart';

class GuestPage extends StatefulWidget {

  @override 
  _GuestPageState createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {

  Future<Page> futurePage;

  @override
  void initState() {
    super.initState();
    futurePage = fetchPage();
  }

  Widget _buildBody(List<Guest> guests) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
      itemCount: guests.length, 
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).pop(Detail(id: guests[index].id, firstName: guests[index].firstName, lastName: guests[index].lastName));
          },
          child: Container(
            margin: EdgeInsets.all(5),
            child: titleContainer(guests[index].firstName + ' ' + guests[index].lastName),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2, 
                  color: Colors.black, 
                  style: BorderStyle.solid
                ),
                image: DecorationImage(
                  image: NetworkImage(guests[index].avatar),
                  fit: BoxFit.cover,  
                ),  
            ),
          ),
        );
      },
    );
  }

  Widget imageContainer(String path) {
    return Container(
      child: Image(
        image: AssetImage(path),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget titleContainer(String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, 
                fontWeight: FontWeight.bold, 
                fontSize: 12,
                
                ),
          ),
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            // border: Border.all(
            //   width: 1,
            //   color: Colors.white,
            //   style: BorderStyle.solid,
            // ),
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
        ),
      ], 
    );
  }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESTS'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FutureBuilder<Page>(
          future: futurePage,
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? _buildBody(snapshot.data.guest) : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class Detail {
  final int id;
  final String firstName;
  final String lastName;

  Detail({this.id, this.firstName, this.lastName});
}