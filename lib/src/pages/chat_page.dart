import 'package:flutter/material.dart';
import 'package:my_app_2/src/widgets/my_appbar.dart';

class ChatPage extends StatefulWidget {
  final String userName;

  const ChatPage({Key key,@required this.userName}) :assert(userName!=null), super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              MyAppbar(
                rightIcon:
                    'https://www.flaticon.com/svg/static/icons/svg/1041/1041916.svg',
                leftIcon:
                    'https://www.flaticon.com/svg/static/icons/svg/860/860825.svg',
                onRightClick: () {},
                onLeftClick: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
              Expanded(child: Center(child: Text(widget.userName??''),)),
            ],
          ),
        ),
      ),
    );
  }
}
