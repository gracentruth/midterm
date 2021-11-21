import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
        ),
      body: Column(

        children: [
          GestureDetector(

            child: Hero(
              tag:'hero',
              child:Image.asset('assets/hotel1.png',
                scale: 10.0,
              ),
            ),
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailPage2();
              }));
            },

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
                const Text('Hotel Name',
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
                Text('AccentColorOverriAccentColorOverriAccentColorOverriAccentColorOverriAccentColorOverri'
                )


              ],
            ),
          ),


        ],
      ),

    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailPage2();
  }
}



class DetailPage2 extends StatefulWidget {


  @override
  _DetailPage2State createState() => _DetailPage2State();
}

class _DetailPage2State extends State<DetailPage2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Column(

        children: [
          Hero(
            tag: 'hero',
            child: Image.asset('assets/hotel1.png'),
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
                const Text('Hotel Name',
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
                Text('AccentColorOverriAccentColorOverriAccentColorOverriAccentColorOverriAccentColorOverri'
                )


              ],
            ),
          ),


        ],
      ),

    );
  }
}
//TODO: Add AccentColorOverride (103)


//
// class DetailPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Transition Demo',
//       home: MainScreen(),
//     );
//   }
// }
//
// class MainScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       body: GestureDetector(
//         child: Hero(
//           tag: 'imageHero',
//           child: Image.network(
//             'https://picsum.photos/250?image=9',
//           ),
//         ),
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (_) {
//             return DetailScreen();
//           }));
//         },
//       ),
//     );
//   }
// }
//
// class DetailScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         child: Center(
//           child: Hero(
//             tag: 'imageHero',
//             child: Image.network(
//               'https://picsum.photos/250?image=9',
//             ),
//           ),
//         ),
//         onTap: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }
// }