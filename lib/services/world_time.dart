import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that lcoation
  String flag; // url to an asset flagt icon
  String url; // location url for api endpoint
  bool isDayTime;

  WorldTime({this.location , this.flag , this.url});
  
  Future<void> getTime() async {
    try {
      var respone = await get('http://worldtimeapi.org/api/timezone/${this.url}');
      var data = jsonDecode(respone.body);

      // get the date time and parse it from string to date formate
      DateTime datetime = DateTime.parse(data["datetime"]);
      // cutting the offset 
      var offset = data['utc_offset'].substring(1,3);

      // add offset to the country
      datetime = datetime.add(Duration(hours: int.parse(offset)));
      isDayTime = datetime.hour > 6 && datetime.hour < 20;
      this.time = DateFormat.jm().format(datetime);
      
    } catch(err) {
      print(err);
    }



  }

}