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
  var front = 'FRONT';
  var back = 'BACK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Container(
        alignment: Alignment.center,
        child: Text(
            front,
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            color: Colors.black,
            fontSize: 40,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: 0.0075,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Image.asset('assets/left_arrow_big.png'),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Image.asset('assets/return.png'),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Image.asset('assets/right_arrow_big.png'),
            ),
          ],
        ),
      ),
    );
  }
}

