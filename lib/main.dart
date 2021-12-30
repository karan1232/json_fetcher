import 'package:flutter/material.dart';
import 'package:json_fetcher/json.dart';

import 'json_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<JsonBuilder> fetchedList = [];

  void fetchJsonList() {
    try {
      List<JsonBuilder> helperList = [];
      jsonList.forEach((element) {
        print(element);
        JsonBuilder tempList = JsonBuilder.fromJson(element);
        helperList.add(tempList);
      });
      print(helperList[0].parent.runtimeType);
      setState(() {
        fetchedList = helperList;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: ListView.builder(
              itemCount: fetchedList.length,
              itemBuilder: (_, index) => ExpandableListView(
                    title: fetchedList[index].parent["name"] == null
                        ? fetchedList[index].name
                        : fetchedList[index].parent["name"],
                receivedList: fetchedList[index],
                  )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchJsonList();
            print(fetchedList.length);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;
  final JsonBuilder receivedList;

  const ExpandableListView({required this.title, required this.receivedList});
  @override
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Center(
                      child: Icon(
                        expandFlag
                            ? Icons.keyboard_arrow_down
                            : Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                        size: 15.0,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    }),
                Text(
                  widget.title,
                )
              ],
            ),
          ),
          ExpandableContainer(expandedHeight: 40,
              expanded: expandFlag,
              child: ListTile(
                      title: Text(widget.receivedList.name),
                    ))
        ],
      );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  const ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 30.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      // curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Padding(padding: const EdgeInsets.only(left: 60),
        child: child,
      ),
    );
  }
}
