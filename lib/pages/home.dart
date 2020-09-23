import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments; // get the arguments from Loading
    var bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage('assets/${bgImage}') ,
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0 , 120.0 , 20.0 , 0),
            child: Column(
              children: [
                FlatButton.icon(onPressed: () async{
                 dynamic result =  await Navigator.pushNamed(context, '/location'); // push the route to location over the main screen 
                 setState(() {
                   print(result);
                   data = result;
                 });
               
                }, icon: Icon(
                  Icons.edit_location,
                  color: Colors.grey[300],

                ), label: Text(
                  'Edit Location',
                  style:TextStyle(
                    color:Colors.grey[300]
                  )
                  )) ,
               SizedBox(height: 20.0,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(
                     data['location'] ,
                     style: TextStyle(
                       fontSize: 28.0,
                       color:Colors.grey[200],
                       letterSpacing: 2.0
                     )
                   ),


               ],),
              SizedBox(height: 20.0,),
              Text(
                data['time'] ,
                style: TextStyle(
                  color:Colors.grey[200],
                  fontSize: 60.0,
                ),
              )

              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
