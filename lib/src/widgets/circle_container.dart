import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final double size;

  CircleContainer(
      {@required this.child, @required this.size})
      : assert(child != null),
        assert(size != null && size >= 50)
       ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: this.child,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: 10,
            offset: Offset(5, 5),
          ),
        ],
      ),
    );
  }
}
