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
import 'package:shrine/mypage.dart';

import 'home.dart';
import 'login.dart';
import 'second.dart';
import 'search.dart';
import 'favorite.dart';
import 'detail.dart';
import 'mypage.dart';
// TODO: Convert ShrineApp to stateful widget (104)

class PassArgs{
  PassArgs({required this.index});
  final int index;
}

class ShrineApp extends StatelessWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',

      home:  HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/second': (context) => SecondPage(),
        '/main': (context) => HomePage(),
        '/search':(context) => SearchPage(),
        '/detail':(context)=>DetailPage(),
        '/fav':(context)=>FavoriteHotel(),
        '/my':(context)=>MyPage(),
      },

      initialRoute: '/login',
      // onGenerateRoute: _getRoute,

    );
  }

}
