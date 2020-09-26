import 'package:flutter/material.dart';
import 'TangoListDetailScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(HomeScreen());
};

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body: TangoGroupsListView(),
      )
    );
  }
}

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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

class TangoGroupsListView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            color: Colors.white
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('category').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return new Text('Loading...');
              default:
                List<DocumentSnapshot> categolies = snapshot.data.documents;
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  itemCount: categolies.length,
                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                      child: Container(
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
                                child: Text(
                                    categolies[index]["name"],
                                    style: TextStyle(
                                      fontSize: 25,
                                    )
                                ),
                              )
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TangoListDetailScreen(categoryName: categolies[index]["name"], categoryID: categolies[index].documentID,)),
                        );
                      }
                    );
                  },
                );
            }
          },
        ),
    );
  }
}