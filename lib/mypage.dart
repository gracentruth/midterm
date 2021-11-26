import 'dart:ui';

import 'package:flutter/material.dart';
import 'app.dart';
import 'detail.dart';
import 'home.dart';

dynamic context2=null;

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  //const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)

  @override
  Widget build(BuildContext context) {
    context2=context;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('My Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  Text('Eunjin Kim',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      )),
                  Text('21900174')
                ],
              ),
            ),
            SizedBox(height: 20),
            const Text('  My Favorite Hotel List',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                )),
            _buildSuggestions(),
          ],
        )
        //resizeToAvoidBottomInset: false,
        );
  }

  Widget _buildSuggestions() {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          itemCount: selected.length,
          itemBuilder: /*1*/ (context, i) {
            if (selected[i] == true) {
              return _buildRow(list[i]['title'], i);
            } else {
              return Container(height: 0.0);
            }
          }),
    );
  }

  Widget _buildRow(String title, i) {
    //  final alreadySaved=_saved.contains(pair);
    return Column(
      children: [
        GestureDetector(
          child: Stack(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 11.0 / 6.0,
                    child: Image.asset(list[i]['image'], fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 130, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[i]['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      'location',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap:(){
            setState(() {
              Navigator.pushNamed(context2,'/detail',
                arguments: PassArgs(index:i),
              );

            });

          },
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
