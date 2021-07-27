import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late String isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data

      String datetime = data['utc_datetime'];
      String offsetsign = data['utc_offset'].substring(0, 1);
      String offsethour = data['utc_offset'].substring(1, 3);
      String offsetmin = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);

      if (offsetsign == '+') {
        now = now.add(Duration(hours: int.parse(offsethour)));
        now = now.add(Duration(minutes: int.parse(offsetmin)));
      }

      if (offsetsign == '-') {
        now = now.subtract(Duration(hours: int.parse(offsethour)));
        now = now.subtract(Duration(minutes: int.parse(offsetmin)));
      }

      isDayTime = (now.hour >= 6 && now.hour <= 20) ? 'true' : 'false';

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error :$e');
      time = 'Error 404! Not Found';
    }
  }
}
