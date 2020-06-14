import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TangoScreen extends StatelessWidget {
  TangoScreen({this.categoryName, this.categoryID, this.currentIndex});
  final String categoryName;
  final String categoryID;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TangoWidget(categoryName: categoryName, categoryID: categoryID, currentIndex: currentIndex),
    );
  }
}

class Header extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Image.asset('assets/checkmark_lightgrey.png'),
                ),
                onTap: () {

                },
              ),
            ],
          )
        ),
      ],
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    );
  }
}

class TangoWidget extends StatefulWidget {
  TangoWidget({this.categoryName, this.categoryID, this.currentIndex});
  final String categoryName;
  final String categoryID;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() {
    return TangoState(categoryName: categoryName, categoryID: categoryID, currentIndex: currentIndex);
  }
}

class TangoState extends State<TangoWidget> {
  TangoState({this.categoryName, this.categoryID, this.currentIndex});
  final String categoryName;
  final String categoryID;
  int currentIndex = 0;
  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('words').where('categories', arrayContains: categoryID).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            List<DocumentSnapshot> words = snapshot.data.documents;
            return Scaffold(
              appBar: Header(),
              body: Container(
                alignment: Alignment.center,
                child: Text(
                  isFront ? words[currentIndex]["indonesia"] : words[currentIndex]["japanese"],
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.0075,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image.asset('assets/left_arrow_big.png'),
                      ),
                      onTap: currentIndex == 0 ? null : () {
                        setState(() {
                          isFront = true;
                          currentIndex--;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image.asset('assets/return.png'),
                      ),
                      onTap: () {
                        setState(() {
                          isFront = !isFront;
                        });
                      },
                    ),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        child: Image.asset('assets/right_arrow_big.png'),
                      ),
                      onTap: currentIndex + 1 >= words.length ? null : () {
                        setState(() {
                          isFront = true;
                          currentIndex++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }
}

