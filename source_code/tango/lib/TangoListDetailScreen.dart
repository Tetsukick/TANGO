import 'package:flutter/material.dart';

class TangoListDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TangoListDetailWidget(),
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
          padding: const EdgeInsets.all(16),
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 18,
            ),
          ),
        ),
      ],
      title: Text(
        'TANGO CHO',
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
  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<TangoListDetailWidget> {
  var listItem = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView.builder(
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
                        Text("Title",
                          style: TextStyle(
                            fontFamily: 'SFProDisplay',
                            color: Color(0xffffffff),
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: 0.0075,
                          ),
                          textAlign: TextAlign.right,
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
                title: Text(listItem[index - 1]),
                onTap: () { /* react to the tile being tapped */ },
              ));},
        itemCount: listItem.length + 1,
      ),
    );
  }
}

