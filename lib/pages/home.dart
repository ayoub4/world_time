import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late String background ;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    if (data['isDaytime'] == true){background = 'day.png';}else{background = 'night.png';}
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/$background'), fit: BoxFit.cover)),
        child: SafeArea(child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0,0),
          child: Column(
            children: [
              TextButton.icon(onPressed: () async{
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time' : result['time'],
                    'location' : result['location'],
                    'isDaytime' : result['isDaytime'],
                    'flag' : result['flag'],
                  };
                  print(data);
                });
              }, label: Text('Edit Location', style: TextStyle(color: Colors.white),), icon: Icon(Icons.edit_location,),
                style: TextButton.styleFrom(backgroundColor: Colors.black54),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'], style: TextStyle(fontSize: 28, letterSpacing: 2),)
                ],
              ), SizedBox(height: 20,),
              Text(data['time'], style: TextStyle(fontSize: 66))
            ],
          ),
        )),
      ),
    );
  }
}
