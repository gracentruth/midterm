import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  // TODO: Make a collection of cards (102)
  // TODO: Add a variable for Category (104)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
          onPressed: (){
              Navigator.pop(context);
          },
        ),
        title:
         Text('Search'),


      ) ,

      body: Center(
        child: Text('You did it!'),
      ),
      //resizeToAvoidBottomInset: false,
    );
  }
}
