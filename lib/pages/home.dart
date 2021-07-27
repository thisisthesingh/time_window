import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, String> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    print(data);

    final loc = data['location'].toString();
    final time = data['time'].toString();
    final flag = data['flag'].toString();
    String dn = data['isDayTime'].toString();

    String bgImage = (dn == 'true') ? 'day.jpg' : 'night.jpg';
    Color bgColor = (dn == 'true') ? Colors.blue : Colors.black;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Change Location',
                    style: TextStyle(color: Colors.grey[300]),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/$flag'),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    loc,
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[300]),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                time,
                style: TextStyle(fontSize: 66.0, color: Colors.grey[300]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
