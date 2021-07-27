import 'package:flutter/material.dart';
import 'package:time_window/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'United Kingdom', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'India', flag: 'india.jpg', url: 'Asia/Kolkata'),
    WorldTime(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'usa.jpg', url: 'America/New_York'),
    WorldTime(location: 'South Korea', flag: 's_korea.jpg', url: 'Asia/Seoul'),
    WorldTime(
        location: 'Indonesia', flag: 'indonesia.jpg', url: 'Asia/Jakarta'),
    WorldTime(
        location: 'Ivory Coast',
        flag: 'ivory_coast.jpg',
        url: 'Africa/Abidjan'),
    WorldTime(location: 'Egypt', flag: 'egypt.jpg', url: 'Africa/Cairo'),
    WorldTime(
        location: 'Bangladesh', flag: 'bangladesh.jpg', url: 'Asia/Dhaka'),
    WorldTime(
        location: 'Sri Lanka', flag: 'sri_lanka.jpg', url: 'Asia/Colombo'),
    WorldTime(
        location: 'United Arab Emirates', flag: 'uae.jpg', url: 'Asia/Dubai'),
    WorldTime(location: 'Pakistan', flag: 'pakistan.jpg', url: 'Asia/Karachi'),
    WorldTime(location: 'Qatar', flag: 'qatar.jpg', url: 'Asia/Qatar'),
    WorldTime(location: 'Kenya', flag: 'kenya.jpg', url: 'Africa/Nairobi'),
    WorldTime(
        location: 'Argentina',
        flag: 'argentina.jpg',
        url: 'America/Argentina/Buenos_Aires'),
    WorldTime(location: 'West Indies', flag: 'wi.jpg', url: 'America/Barbados'),
    WorldTime(
        location: 'Colorado', flag: 'colorado.jpg', url: 'America/Denver'),
    WorldTime(
        location: 'Indiana',
        flag: 'indiana.jpg',
        url: 'America/Indiana/Petersburg'),
    WorldTime(location: 'Jamaica', flag: 'jamaica.jpg', url: 'America/Jamaica'),
    WorldTime(
        location: 'Mexico', flag: 'mexico.jpg', url: 'America/Mexico_City'),
    WorldTime(
        location: 'Trinidad and Tobago',
        flag: 'tnt.jpg',
        url: 'America/Port_of_Spain'),
    WorldTime(
        location: 'Brazil', flag: 'brazil.jpg', url: 'America/Rio_Branco'),
    WorldTime(location: 'Iraq', flag: 'iraq.jpg', url: 'Asia/Baghdad'),
    WorldTime(location: 'Thailand', flag: 'thailand.jpg', url: 'Asia/Bangkok'),
    WorldTime(location: 'Canada', flag: 'canada.jpg', url: 'America/Toronto'),
    WorldTime(location: 'Hong Kong', flag: 'hk.jpg', url: 'Asia/Hong_Kong'),
    WorldTime(location: 'Israel', flag: 'israel.jpg', url: 'Asia/Jerusalem'),
    WorldTime(
        location: 'Afghanistan', flag: 'afghanistan.jpg', url: 'Asia/Kabul'),
    WorldTime(location: 'Nepal', flag: 'nepal.jpg', url: 'Asia/Kathmandu'),
    WorldTime(location: 'China', flag: 'china.jpg', url: 'Asia/Shanghai'),
    WorldTime(
        location: 'Singapore', flag: 'singapore.jpg', url: 'Asia/Singapore'),
    WorldTime(location: 'Iran', flag: 'iran.jpg', url: 'Asia/Tehran'),
    WorldTime(location: 'Japan', flag: 'japan.jpg', url: 'Asia/Tokyo'),
    WorldTime(
        location: 'Bermuda', flag: 'bermuda.jpg', url: 'Atlantic/Bermuda'),
    WorldTime(
        location: 'Portugal', flag: 'portugal.jpg', url: 'Atlantic/Madeira'),
    WorldTime(
        location: 'South Georgia',
        flag: 'sg.jpg',
        url: 'Atlantic/South_Georgia'),
    WorldTime(
        location: 'Adelaide', flag: 'australia.jpg', url: 'Australia/Adelaide'),
    WorldTime(
        location: 'Brisbane', flag: 'australia.jpg', url: 'Australia/Brisbane'),
    WorldTime(
        location: 'Broken Hill',
        flag: 'australia.jpg',
        url: 'Australia/Broken_Hill'),
    WorldTime(
        location: 'Sydney', flag: 'australia.jpg', url: 'Australia/Sydney'),
    WorldTime(location: 'Perth', flag: 'australia.jpg', url: 'Australia/Perth'),
    WorldTime(
        location: 'Melbourne',
        flag: 'australia.jpg',
        url: 'Australia/Melbourne'),
    WorldTime(
        location: 'Netherlands',
        flag: 'netherlands.jpg',
        url: 'Europe/Amsterdam'),
    WorldTime(location: 'Germany', flag: 'germany.jpg', url: 'Europe/Berlin'),
    WorldTime(location: 'Hungary', flag: 'hungary.jpg', url: 'Europe/Budapest'),
    WorldTime(location: 'Ireland', flag: 'ireland.jpg', url: 'Europe/Dublin'),
    WorldTime(location: 'Turkey', flag: 'turkey.jpg', url: 'Europe/Istanbul'),
    WorldTime(location: 'Spain', flag: 'spain.jpg', url: 'Europe/Madrid'),
    WorldTime(location: 'Monaco', flag: 'monaco.jpg', url: 'Europe/Monaco'),
    WorldTime(location: 'Russia', flag: 'russia.jpg', url: 'Europe/Moscow'),
    WorldTime(location: 'France', flag: 'france.jpg', url: 'Europe/Paris'),
    WorldTime(location: 'Italy', flag: 'italy.jpg', url: 'Europe/Rome'),
    WorldTime(location: 'Austria', flag: 'austria.jpg', url: 'Europe/Vienna'),
    WorldTime(
        location: 'Maldives', flag: 'maldives.jpg', url: 'Indian/Maldives'),
    WorldTime(
        location: 'Mauritius', flag: 'mauritius.jpg', url: 'Indian/Mauritius'),
    WorldTime(location: 'New Zealand', flag: 'nz.jpg', url: 'Pacific/Auckland'),
    WorldTime(location: 'Fiji', flag: 'fiji.jpg', url: 'Pacific/Fiji'),
    WorldTime(location: 'Tuvalu', flag: 'tuvalu.jpg', url: 'Pacific/Funafuti'),
    WorldTime(location: 'Hawaii', flag: 'hawaii.jpg', url: 'Pacific/Honolulu'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }),
    );
  }
}
