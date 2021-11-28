import 'package:flutter/material.dart';

bool _expanded = false;
bool _ischecked1 = false;
bool _ischecked2 = false;
bool _ischecked3 = false;
String date = '';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //bool _ischecked = false;
// DateTime _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Search'),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              child: ExpansionPanelList(

                children: [
                  ExpansionPanel(
                    headerBuilder: (context, isExpanded) {
                      return Row(
                        children: const [
                          SizedBox(width: 20),
                          Text('Filter',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              )),
                          SizedBox(width: 40),
                          Text('select filters'),
                        ],
                      );
                    },
                    body: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 120),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: _ischecked1,
                                        onChanged: (value) {
                                          setState(() {
                                            _ischecked1 = !_ischecked1;
                                          });
                                        }),
                                    Text('No Kids Zone')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: _ischecked2,
                                        onChanged: (value) {
                                          setState(() {
                                            _ischecked2 = !_ischecked2;
                                          });
                                        }),
                                    Text('Pet-Friendly')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Checkbox(
                                        value: _ischecked3,
                                        onChanged: (value) {
                                          setState(() {
                                            _ischecked3 = !_ischecked3;
                                          });
                                        }),
                                    Text('Free breakfast')
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    isExpanded: _expanded,
                    canTapOnHeader: true,
                  ),
                ],
                expandedHeaderPadding: EdgeInsets.all(0),
                expansionCallback: (panelIndex, isExpanded) {
                  _expanded = !_expanded;
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🗓checked in'),
                    Text(date),
                  ],
                ),
                SizedBox(width: 30),
                ElevatedButton(
                  onPressed: () {
                    Future<DateTime?> selectedDate;

                    selectedDate = showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      // 초깃값
                      firstDate: DateTime(2018),
                      // 시작일
                      lastDate: DateTime(2030),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.dark(), //다크 테마
                          child: child!,
                        );
                      }, //
                    );
                    selectedDate.then((dateTime) {
                      setState(() {
                        date = dateTime.toString();
                      });
                    });
                  },
                  child: Text('   select date   '),
                )
              ],
            ),
            Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => FlutterDialog(),
                    child: Text('Search'),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            //Dialog Main Title
            title: Container(
                height: 30,
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                color: Colors.blueAccent,
                child: Text('please')),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(children: [
                  Text(date),
                ]),
                Row(),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
