import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body: MyListView(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyListView(),
      ),
    );
  }
}

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Edit'),
        ),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo_tango.png',
            fit: BoxFit.contain,
            height: 34,
          )
        ],

      ),
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}

class MyListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<Map> contents = [
      {
      "id":"TC0001-191205",
      "name":"English"},
      {
        "id":"TC0002-191205",
        "name":"日本語"},
      {
        "id":"TC0003-191205",
        "name":"Bahasa Indonesia"},
    ];
    return new Container(
        decoration: new BoxDecoration(
            color: Colors.white
        ),
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          itemCount: contents.length,
          itemBuilder: (BuildContext context, int index) {

            return Container(
              margin: EdgeInsets.only(bottom: 20.0),
              height: 97,
              decoration: new BoxDecoration(
                boxShadow: [BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0,3),
                    blurRadius: 6,
                    spreadRadius: 0

                ) ],

              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Container(
                    decoration: new BoxDecoration(
                      color: Color(0xffffffff),
                      border: Border.all(
                          color: Color(0xff007aff),
                          width: 0.5
                      ),
                    ),
                    child: Center(
                      child: Text(contents[index]["name"]),
                    )
                ),
              ),
            );
          },
        ));
  }
}
