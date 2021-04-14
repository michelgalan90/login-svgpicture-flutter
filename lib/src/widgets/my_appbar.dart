import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app_2/src/pages/chat_page.dart';

class MyAppbar extends StatelessWidget {
  final String leftIcon, rightIcon;
  final VoidCallback onLeftClick, onRightClick;
  MyAppbar({Key key, @required this.leftIcon, @required this.rightIcon, this.onLeftClick, this.onRightClick})
      : super(key: key);

//'https://www.flaticon.com/svg/static/icons/svg/3112/3112977.svg'
//'https://www.flaticon.com/svg/static/icons/svg/1041/1041916.svg'

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton(
            padding: EdgeInsets.all(15),
            child: SvgPicture.network(
              leftIcon,
              width: 30,
            ),
            onPressed: onLeftClick,
          ),
          Text(
            'LOGO',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.network(
                    rightIcon,
                    width: 30,
                  ),
                ),
                Positioned(
                  right: 7,
                  top: 7,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            onPressed: onRightClick,
          ),
        ],
      ),
    );
  }
}
