import 'package:flutter/material.dart';
import 'TangoScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TangoListDetailScreen extends StatelessWidget {
  TangoListDetailScreen({this.categoryName, this.categoryID});
  final String categoryName;
  final String categoryID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TangoListDetailWidget(categoryName: categoryName, categoryID: categoryID,),
    );
  }
}

class Header extends StatelessWidget with PreferredSizeWidget{
  Header({this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        title ?? '',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.grey[200],
      centerTitle: true,
      elevation: 0.0,
    );
  }
}

class TangoListDetailWidget extends StatefulWidget {
  TangoListDetailWidget({this.categoryName, this.categoryID});
  final String categoryName;
  final String categoryID;

  @override
  State<StatefulWidget> createState() {
    return ListState(categoryName: categoryName, categoryID: categoryID);
  }
}

class ListState extends State<TangoListDetailWidget> {
  ListState({this.categoryName, this.categoryID});
  final String categoryName;
  final String categoryID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: categoryName),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('words').where('categories', arrayContains: categoryID).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              List<DocumentSnapshot> words = snapshot.data.documents;
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {

                  if (index == 0) {
                    return Container(
                      width: 375,
                      height: 110,
                      decoration: new BoxDecoration(
                          color: Color(0xff098a8c),
                          border: Border.all(
                              color: Color(0xff098a8c),
                              width: 1
                          )
                      ),
                      child: Container(
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            verticalDirection: VerticalDirection.up,
                            textDirection: TextDirection.rtl,
                            children: [
                              Expanded(
                                child: Text(categoryName,
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    color: Color(0xffffffff),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0.0075,
                                  ),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]
                        ),
                      ),
                    );
                  }

                  return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black38),
                        ),
                      ),
                      child: ListTile(
                        trailing: Image.asset('assets/right_detail_grey.png'),
                        title: Text(
                          words[index - 1]["indonesia"],
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TangoScreen(categoryName: categoryName, categoryID: categoryID, currentIndex: index - 1,)),
                          );
                        },
                      ));},
                itemCount: words.length + 1,
              );
          }
        },
      ),
    );
  }
}

