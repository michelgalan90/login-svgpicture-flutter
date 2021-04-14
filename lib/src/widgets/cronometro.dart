import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app_2/src/widgets/circle_container.dart';
import 'package:after_layout/after_layout.dart';

class Cronometro extends StatefulWidget {
  final double initTime, fontSize;

  const Cronometro({Key key, this.initTime = 0, this.fontSize})
      : super(key: key);

  @override
  CronometroState createState() {
    return CronometroState();
  }
}

class CronometroState extends State<Cronometro> with AfterLayoutMixin {
  double _time;

  Timer _timer;

  @override
  void initState() {
    //se ejecuta una sola vez cuando se va a renderizar el widget
    super.initState();
    print('initState');
    _time = widget.initTime;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    /* print(this.context == context);//se refiere al mismo context en memoria
    showDialog(      
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('afterFirstLayout'),);
      },
    ); */
  }

  @override
  void didUpdateWidget(Cronometro oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('old fontSize ${oldWidget.fontSize}');
    print('new fontSize ${widget.fontSize}');
  }

  @override
  void dispose() {
    //cancel timer
    print('dispose');
    _stop(); //cancela el timer antes de destruir el widget
    super.dispose();
  }

  void _start() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _time++;
      });
    });
  }

  void _stop() {
    // if (_timer != null) _timer.cancel(); //esto es lo mismo que la linea de abajo
    _timer
        ?.cancel(); //si es distinto de nulo ejecuta cancel(), sino no hagas nada.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            _time.toString(),
            style: TextStyle(
              fontSize: widget.fontSize ?? 20,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                // color: Colors.green,
                // padding: EdgeInsets.zero,
                child: CircleContainer(child: Icon(Icons.play_arrow), size: 50),
                onPressed: _start,
              ),
              CupertinoButton(
                // color: Colors.pink,
                child: CircleContainer(child: Icon(Icons.stop), size: 50),
                onPressed: _stop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
