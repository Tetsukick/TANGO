import 'package:flutter/material.dart';

class TangoListDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
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