import 'package:flutter/material.dart';

class TangoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TangoWidget(),
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
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Image.asset('assets/trash.png'),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Image.asset('assets/pen.png'),
              ),
              Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Image.asset('assets/checkmark_lightgrey.png'),
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
  @override
  State<StatefulWidget> createState() {
    return TangoState();
  }
}

class TangoState extends State<TangoWidget> {
  var listItem = ['one', 'two', 'three'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(),
    );
  }
}

