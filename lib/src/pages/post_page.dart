import 'package:flutter/material.dart';
import 'package:my_app_2/src/widgets/my_appbar.dart';
import '../utils/fake_list.dart';

class PostPage extends StatefulWidget {
  static final routeName = 'postPage';
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  List<String> _data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                onRightClick: () {
                  // _data.add('Item ${DateTime.now()}');
                  _data.insert(_data.length > 0 ? _data.length - 1 : 0,
                      DateTime.now().toString());
                  setState(() {});
                },
                onLeftClick: () {
                  Navigator.pop(
                    context,
                  );
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _data[index],
                      ),
                      onTap: () {
                        print('hola');
                      },
                      onLongPress: () {
                        _data.removeAt(index);
                        setState(() {});
                      },
                      subtitle: Text('Subtitulo'),
                      leading: Icon(Icons.supervised_user_circle),
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
