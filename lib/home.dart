// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


const isSelected = <bool>[false, false];

List<Map> list= [
  {'title':'first','image':'assets/hotel1.png'},
  {'title':'second','image':'assets/hotel2.png'},
  {'title':'third','image':'assets/hotel3.png'},
  {'title':'fourth','image':'assets/hotel4.png'},
  {'title':'fifth','image':'assets/hotel5.png'},
  {'title':'sixth','image':'assets/hotel6.png'},

];

// {
//   'image':'assets/diamond.png',
//   'title':'first hotel'
// };



class HomePage extends StatelessWidget {


  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    //print(file[0]['image']);
    return Scaffold(
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
                  isSelected[index] = !isSelected[index];
              },
              children:const <Widget>[
                Icon(Icons.list),
                Icon(Icons.grid_view),
              ],
            ),
          ),
         GridViewPage()



        ],

      ),
    );
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
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(list[index]['image'],
              fit:BoxFit.cover),
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
    return Container(
      child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,//1개 행에 보여줄 아이템 개수
          padding: const EdgeInsets.all(16.0),
          // childAspectRatio: 9.0 / 9.0, // 아이템의 가로세로 비율
          // TODO: Build a grid of cards (102)
          children: _buildGridCards(6) //아이템의 반복문 항목 형성
      ),

    );
  }
}


class ListViewPage extends StatelessWidget {
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
          (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 8.0 / 8.0,
              child: Container(
                padding: const EdgeInsets.all(0.0),

                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Image.asset(list[index]['image'],
                  fit:BoxFit.fill,

                  ),
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
    return Container(
      child: GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 1,//1개 행에 보여줄 아이템 개수
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 6.0 / 2.0, // 아이템의 가로세로 비율
          // TODO: Build a grid of cards (102)
          children: _buildGridCards(4) //아이템의 반복문 항목 형성
      ),

    );
  }
}
