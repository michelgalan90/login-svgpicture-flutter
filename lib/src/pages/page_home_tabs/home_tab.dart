import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_2/src/pages/post_page.dart';
import 'package:my_app_2/src/widgets/avatar.dart';
import 'package:my_app_2/src/widgets/cronometro.dart';
import 'package:my_app_2/src/widgets/my_btn.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // with AutomaticKeepAliveClientMixin<HomeTab>
  bool _isEnable = false;
  double _fontSize = 20;
  @override
  Widget build(BuildContext context) {
    print('home');
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey,
                  height: constraints.maxHeight * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Avatar(
                        size: constraints.maxHeight * 0.3,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text('Bienvenido'),
                      Text(
                        'Michel Galan',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      _isEnable == true
                          ? Cronometro(
                              initTime: 10,
                              fontSize: _fontSize,
                            )
                          : Container(),
                      // SizedBox(
                      //   height: 30,
                      // ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(10.0),
                        color: Colors.pink,
                      );
                    },
                  ),
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(10.0),
                        color: Colors.pink,
                      );
                    },
                  ),
                ),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: 120,
                        height: 120,
                        margin: EdgeInsets.all(10.0),
                        color: Colors.pink,
                      );
                    },
                  ),
                ),
                /* MyBtn(
                label: 'My Posts',
                onPressed: () {
                  Navigator.pushNamed(context, PostPage.routeName);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                  //  padding: EdgeInsets.zero,
                  color: Colors.blue,
                  child: Text('enabled: $_isEnable'),
                  onPressed: () {
                    setState(() {
                      _isEnable = !_isEnable;
                    });
                  }),
              SizedBox(
                height: 10.0,
              ),
              CupertinoButton(
                  //  padding: EdgeInsets.zero,
                  color: Colors.green,
                  child: Text('Go to Chat'),
                  onPressed: () {}), */
              ],
            ),
          );
        },
      ),
    );
  }

/*   @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; */
}
