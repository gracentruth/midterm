import 'package:flutter/material.dart';

bool _expanded = false;
bool _ischecked1 = false;
bool _ischecked2 = false;
bool _ischecked3 = false;
String date = '';
String savedfilter = '';

List<Map> filter = [
  {'filtername': 'No Kids Zone', 'checked': false},
  {'filtername': 'No Kids Zone2', 'checked': false},
  {'filtername': 'No Kids Zone3', 'checked': false}
];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //bool _ischecked = false;
// DateTime _selectedTime;

  Widget buildRow(int i) {
    return Row(
      children: [
        SizedBox(width: 90),
        Checkbox(
            value: filter[i]['checked'],
            onChanged: (value) {
              setState(() {
                filter[i]['checked'] = !filter[i]['checked'];
              });
            }),
        Text(filter[i]['filtername'])
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    savedfilter = '';
    for (int i = 0; i < 3; i++) {
      if (filter[i]['checked'] == true) {
        savedfilter += filter[i]['filtername'] + ' / ';
      }
    }
    print(savedfilter);
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
                    body: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, i) {
                          return buildRow(i);
                        }),
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
              height: 300,
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
            // backgroundColor: Colors.lightBlueAccent,
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            //Dialog Main Title
            title: Container(
              child: Text('hi'),
              decoration: BoxDecoration(
                  // color: Colors.blue,

                  ),
            ),
            //
            content: Container(
              color: Colors.white,
              width: 300.0,
              height: 200.0,
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: [
                    Icon(
                      Icons.filter_list_sharp,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Container(
                        width: 200,
                        child: Text(savedfilter,
                            style: const TextStyle(
                              fontSize: 13,
                            ))),
                  ]),
                  const SizedBox(height: 20.0),
                  Row(children: [
                    const Icon(
                      Icons.assignment_turned_in_outlined,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                    SizedBox(width: 10.0),
                    Container(
                        width: 200,
                        child: Text(date,
                            style: TextStyle(
                              fontSize: 13,
                            ))),
                  ]),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      const SizedBox(width: 40.0),
                      ElevatedButton(onPressed:(){
                        Navigator.pop(context);
                      },
                          child:Text('Search')),
                      const SizedBox(width: 20.0),
                      ElevatedButton(onPressed:(){
                        Navigator.pop(context);
                      },
                          child:Text('Cancel'))
                    ],
                  ),
                ],
              ),
            ),

          );
        });
  }
}

// Column(
// children: [
// Row(
// children: [
// SizedBox(width: 120),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Checkbox(
// value: _ischecked1,
// onChanged: (value) {
// setState(() {
// _ischecked1 = !_ischecked1;
// });
// }),
// Text('No Kids Zone')
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Checkbox(
// value: _ischecked2,
// onChanged: (value) {
// setState(() {
// _ischecked2 = !_ischecked2;
// });
// }),
// Text('Pet-Friendly')
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Checkbox(
// value: _ischecked3,
// onChanged: (value) {
// setState(() {
// _ischecked3 = !_ischecked3;
// });
// }),
// Text('Free breakfast')
// ],
// ),
// ],
// ),
// ],
// ),
// ],
// ),
