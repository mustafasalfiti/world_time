import 'package:flutter/material.dart';
import '../services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  var time;
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location:'Jerusalem' , flag: 'israel.png' , url: 'Asia/Jerusalem');
    await instance.getTime();
    Navigator.pushReplacementNamed(context , '/home' , arguments: {
      'location':instance.location,
      'flag':instance.flag ,
      'time':instance.time ,
      'isDayTime':instance.isDayTime

    }); // change the route stack 
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitFadingCircle(
          color: Colors.blue[400],
          size: 80.0,
            ),

      )
      
    );
  }
}