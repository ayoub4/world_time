import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
   String location;
   late String time;
   String flag;
   String url;
   late bool isDaytime;

WorldTime({ required this.location, required this.flag, required this.url});
   Future<void> getTime() async{
try{
   Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
   Map data = jsonDecode(response.body);
   String date = data['datetime'];
   String offset = data['utc_offset'].substring(1,3);
   // print(offset);
   // print(date);
   DateTime now = DateTime.parse(date);
   now = now.add(Duration(hours: int.parse(offset)));


   time = DateFormat.jm().format(now);
   isDaytime = now.hour > 6 && now.hour < 20 ;

}catch (e){
      print(e);
      time = 'ERROR GETTING TIME DATA';
   }
   }
}





