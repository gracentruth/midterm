import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';



List<Map> list= [
  {'title':'First Hotel','image':'assets/hotel1.png'},
  {'title':'Second Hotel','image':'assets/hotel2.png'},
  {'title':'Third Hotel','image':'assets/hotel3.png'},
  {'title':'Fourth Hotel','image':'assets/hotel4.png'},
  {'title':'Fifth Hotel','image':'assets/hotel5.png'},
  {'title':'Sixth Hotel','image':'assets/hotel6.png'},

];

int viewCount=2;

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  List<bool> isSelected = <bool>[false, false];
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    //print(file[0]['image']);
    return Scaffold(
      //resizeToAvoidBottomInset : false,
     appBar:AppBar(
       title: const Center(
         child: Text('    Main'),
       ),
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.search),
           onPressed: () {
            // print('search button is clicked ');
             Navigator.pushNamed(context, '/search');
           },
         ),
         IconButton(
           icon: Icon(Icons.language),
           onPressed: ()async{
             final url = 'http://www.handong.edu/';
             if(await canLaunch(url)){
              await launch(
                url,
                forceSafariVC: true,
              );
             }
           }
         ),
       ],
     ) ,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.fromLTRB(30.0, 110.0, 0, 0),
              child: Text('Pages',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 30.0,

                ),

              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('Home'),
              onTap: () {
                //print('home is clicked');
                Navigator.pushNamed(context, '/main');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.blue,
              ),
              title: Text('Search'),
              onTap: () {
                print('setting is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.location_city,
                color: Colors.blue,
              ),
              title: Text('Favorite Hotel'),
              onTap: () {
                print('Q&A is clicked');
              },

            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: Text('My Page'),
              onTap: () {
                print('Q&A is clicked');
              },

            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(250.0,20.0, 0.0, 0.0),

            child:ToggleButtons(
              color: Colors.black.withOpacity(0.60),
              selectedColor: Color(0xFF6200EE),
              selectedBorderColor: Color(0xFF6200EE),
              fillColor: Color(0xFF6200EE).withOpacity(0.08),
              splashColor: Color(0xFF6200EE).withOpacity(0.12),
              hoverColor: Color(0xFF6200EE).withOpacity(0.04),
              borderRadius: BorderRadius.circular(4.0),
              isSelected: isSelected,
              onPressed: (index) {
                // Respond to button selection
              setState(() {
                  viewCount=index+1;
                  print(viewCount);
              });
              },
              children:const <Widget>[
                Icon(Icons.list),
                Icon(Icons.grid_view),
              ],
            ),
          ),
         View()
        ],

      ),
    );
  }
}

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(viewCount==2){
      return GridViewPage();
    }
    else {
      return ListViewPage();
    }
  }
}


class GridViewPage extends StatelessWidget {
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset(list[index]['image'],
                    fit:BoxFit.cover),
              ),

            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                    children: [
                      SizedBox(width:20.0),
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
                  const SizedBox(height: 3.0),
                  Row(
                    children: [
                      SizedBox(width:22.0),
                      Text(list[index]['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),),

                    ],
                  ),

                  const SizedBox(height:0.0),
                  Row(
                    children:[
                      const Icon(Icons.location_on,
                        color:Colors.lightBlueAccent,
                      ),
                      Text(list[index]['title']),
                    ]
                  ),
                  Row(
                    children:[
                      SizedBox(width:80.0),
                      TextButton(onPressed: (){

                      },
                          child:const Text(
                            'more'
                          ))
                    ]
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,//1개 행에 보여줄 아이템 개수
          padding: const EdgeInsets.all(10.0),
          childAspectRatio: 10.0 / 13.0, // 아이템의 가로세로 비율
          // TODO: Build a grid of cards (102)
          children: _buildGridCards(6) //아이템의 반복문 항목 형성
      ),

    );
  }
}


class ListViewPage extends StatelessWidget {
  List<Card> _buildListCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child:ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child:AspectRatio(
                  aspectRatio:11.0 / 11.0,
                  child: Image.asset(list[index]['image'],
                      fit:BoxFit.cover),
                ),
              ),

            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('$index'),
                  const SizedBox(height: 8.0),
                  Text(list[index]['title']),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: GridView.count(
          scrollDirection: Axis.vertical,

          shrinkWrap: true,
          crossAxisCount: 1,//1개 행에 보여줄 아이템 개수
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 6.0 / 2.0, // 아이템의 가로세로 비율
          // TODO: Build a grid of cards (102)
          children: _buildListCards(6) //아이템의 반복문 항목 형성
      ),

    );
  }
}
