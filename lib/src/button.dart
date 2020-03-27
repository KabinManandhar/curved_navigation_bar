// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   Icon icon;

//   MyButton({
//     Key key,
//     this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(4),
//       child: Container(

//         padding: EdgeInsets.all(20),
//         child: Center(child: icon),
//         decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.grey[300],
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey[600],
//                   offset: Offset(4.0, 4.0),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0),
//               BoxShadow(
//                   color: Colors.white,
//                   offset: Offset(-4.0, -4.0),
//                   blurRadius: 15.0,
//                   spreadRadius: 1.0),
//             ],
//             gradient: LinearGradient(
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 colors: [
//                   Colors.grey[200],
//                   Colors.grey[300],
//                   Colors.grey[400],
//                   Colors.grey[500],
//                 ],
//                 stops: [
//                   0.1,
//                   0.3,
//                   0.8,
//                   1
//                 ])),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SoftButton extends StatefulWidget {
  final Widget icon;
  final bool opacity;
  final String label;
  final double radius;
  final MainAxisAlignment mainAxisAlignment;
  final double height;
  final double width;
  final double iconSize;
  final double fontSize;

  SoftButton(
      {Key key,
      this.opacity = true,
      this.icon,
      this.label = "",
      this.radius = 62,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.height = 60,
      this.width = 60,
      this.fontSize = 30,
      this.iconSize = 20})
      : super(key: key);

  @override
  _SoftButtonState createState() => _SoftButtonState();
}

class _SoftButtonState extends State<SoftButton> {
  bool tapCheck = false;
  List<Color> clicked = [
    Colors.grey[700],
    Colors.grey[600],
    Colors.grey[500],
    Colors.grey[200],
  ];
  List<Color> unclicked = [
    Colors.grey[200],
    Colors.grey[300],
    Colors.grey[400],
    Colors.grey[500],
  ];
  List<double> forClicked = [0, 0.1, 0.3, 1];
  List<double> forUnclicked = [0.1, 0.3, 0.8, 1];
  Color buttonColor = Colors.grey[300];
  Color lightShadow = Colors.white;
  Color darkShadow = Colors.grey[600];
  double offset = 4.0;
  double inset = -4.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        setState(() {
          tapCheck = !tapCheck;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          tapCheck = !tapCheck;
        });
      },
      onHorizontalDragCancel: () {
        setState(() {
          tapCheck = !tapCheck;
        });
      },
      onVerticalDragCancel: () {
        setState(() {
          tapCheck = !tapCheck;
        });
      },
      onTapCancel: () {
        setState(() {
          tapCheck = !tapCheck;
        });
      },
      child: Stack(children: <Widget>[
        AnimatedOpacity(
          opacity: widget.opacity ? 1 : 0,
          duration: Duration(milliseconds: 400),
          child: AnimatedContainer(
            width: widget.width,
            height: widget.height,
            padding: EdgeInsets.all(20),
            child: widget.icon != null
                ? IconButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.grey[900],
                    iconSize: tapCheck ? widget.iconSize - 1 : widget.iconSize,
                    icon: widget.icon,
                    onPressed: null,
                  )
                : Icon(null),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.radius),
                color: buttonColor,
                boxShadow: [
                  BoxShadow(
                      color: tapCheck ? lightShadow : darkShadow,
                      offset: Offset(offset, offset),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: tapCheck ? darkShadow : lightShadow,
                      offset: Offset(inset, inset),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: tapCheck ? clicked : unclicked,
                    stops: tapCheck ? forClicked : forUnclicked)),
            duration: Duration(milliseconds: 150),
          ),
        ),
      ]),
    );
  }
}
