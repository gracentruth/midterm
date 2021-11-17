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

class HomePage extends StatelessWidget {
  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
