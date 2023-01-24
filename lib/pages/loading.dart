import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Morocco', flag: 'morocco.png', url: 'Africa/Casablanca');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'time' : instance.time,
      'flag' : instance.flag,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 30.0,
        ),
      )
    );
  }
}
