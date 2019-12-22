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
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                trailing: Image.asset('assets/right_detail_grey.png'),
                title: Text('$index'),
                onTap: () { /* react to the tile being tapped */ },
              ));},
        itemCount: listItem.length,
      ),
    );
  }
}

