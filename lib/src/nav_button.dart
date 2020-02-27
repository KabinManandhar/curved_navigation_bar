import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;

  NavButton({this.onTap, this.position, this.length, this.index, this.child});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Opacity(
          opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
          child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFDADFF0),
                        offset: Offset(8, 6),
                        blurRadius: 8),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-8, -6),
                        blurRadius: 8),
                  ]),
              child: Transform.translate(
                offset: Offset(
                    0, difference < 1.0 / length ? verticalAlignment * 40 : 0),
                child: Opacity(
                    opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                    child: child),
              )),
        ),
      ),
    );
  }
}
