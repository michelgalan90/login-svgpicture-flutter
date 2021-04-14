import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_2/src/widgets/my_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesPageArgs {
  final String username;
  final bool isActive;

  ImagesPageArgs({@required this.username, @required this.isActive});
}

class ImagePage extends StatefulWidget {
  static final routeName = 'image';
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    final ImagesPageArgs args = ModalRoute.of(context).settings.arguments;

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
              Expanded(
                child: GridView.builder(
                  itemCount: 100,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,),
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      child: Text('${index + 1}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
