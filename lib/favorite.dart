import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'detail.dart';
import 'home.dart';


class FavoriteHotel extends StatefulWidget {
  const FavoriteHotel({Key? key}) : super(key: key);

  @override
  _FavoriteHotelState createState() => _FavoriteHotelState();
}

class _FavoriteHotelState extends State<FavoriteHotel> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'d',
      home:Scaffold(
        appBar: AppBar(
          title:Text('Favorite Hotels'),
          leading: IconButton(
            icon:Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },

          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.list),
          //     onPressed: _pushSaved,
          //     tooltip: 'Saved Suggestions',
          //   ),
          // ],

        ),
        body:_buildSuggestions(),
      ),
    );
  }


  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: selected.length,
        itemBuilder: /*1*/ (context, i) {
          if(selected[i]==true) {
            return _buildRow(list[i]['title']);
          } else {
            return Container(height:0.0);
          }
        });
  }

  Widget _buildRow(String title) {
    //  final alreadySaved=_saved.contains(pair);
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight:FontWeight.w800,
          fontSize: 18,
        ),
      ),

      onTap: () {      // NEW lines from here...
        setState(() {


        });
      },               // ... to here.
    );
  }

  // void _pushSaved() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute<void>(
  //       builder: (context) {
  //         final tiles = _saved.map(
  //               (pair) {
  //             return ListTile(
  //               title: Text(
  //                 pair.asPascalCase,
  //               ),
  //             );
  //           },
  //         );
  //         final divided = tiles.isNotEmpty
  //             ? ListTile.divideTiles(
  //           context: context,
  //           tiles: tiles,
  //         ).toList()
  //             : <Widget>[];
  //
  //         return Scaffold(
  //           appBar: AppBar(
  //             title: const Text('Saved Suggestions'),
  //           ),
  //           body: ListView(children: divided),
  //         );
  //       },
  //     ), // ...to here.
  //   );
  // }
}


