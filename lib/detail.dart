import 'package:flutter/material.dart';

import 'app.dart';
import 'home.dart';


List<bool> selected=[
  false,false,false,false,false,false
];


class  DetailPage extends StatefulWidget {

 DetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {

  //const DetailPage({Key? key}) : super(key: key);ㅐ

  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as PassArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(
        children: [
           Stack(
              children: [
            GestureDetector(
              child: Image.asset(list[args.index]['image']),
               onDoubleTap: (){
                  setState(() {
                  selected[args.index]=!selected[args.index];
                 });
                  },),


             Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    child:Icon(selected[args.index]? Icons.favorite:null,
                      size: 40,
                      color: selected[args.index]? Colors.red:Colors.white,

                    ),
                    alignment: Alignment.topRight,
                  ),
                ),

              ],
            ),




          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height:20),
                Row(
                  children: const [
                    Icon(Icons.star,
                      color:Colors.yellowAccent,
                    ),
                    Icon(Icons.star,
                      color:Colors.yellowAccent,
                    ),
                    Icon(Icons.star,
                      color:Colors.yellowAccent,
                    )
                  ],
                ),
                SizedBox(height:10),
                Text(list[args.index]['title'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                  ),),
                SizedBox(height:10),
                Row(
                  children: const [
                    Icon(Icons.location_on,
                      color: Colors.lightBlueAccent,),
                    Text('Address',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),)
                  ],
                ),

                Row(
                  children: const [
                    Icon(Icons.call,
                      color: Colors.lightBlueAccent,
                    ),
                    Text('010-0000-0000',
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                      ),)
                  ],
                ),
                SizedBox(height:15),
                Container(
                  height:1.0,
                  width:500.0,
                  color:Colors.grey,
                ),
                SizedBox(height:15),
                Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                    'Alps. Situated 1,578 meters above sea level, it is one of the '
                    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                    'half-hour walk through pastures and pine forest, leads you to the '
                    'lake, which warms to 20 degrees Celsius in the summer. Activities '
                    'enjoyed here include rowing, and riding the summer toboggan run.',
                  style: TextStyle(
                      color:Colors.lightBlueAccent
                  ),
                )


              ],
            ),
          ),


        ],
      ),

    );
  }
}




