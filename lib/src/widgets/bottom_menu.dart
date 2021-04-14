import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomMenuItem {
  final String iconPath, label;
  

  BottomMenuItem({@required this.iconPath, @required this.label});
}

class BottomMenu extends StatelessWidget {
  final List<BottomMenuItem> items;
  final int currentPage;

  final void Function(int) changePage;

  BottomMenu(
      {@required this.items,
      @required this.currentPage,
      @required this.changePage})
      : assert(items != null && items.length > 0),
        assert(currentPage != null && currentPage >= 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final bool isActive = index == currentPage;
            final BottomMenuItem item = items[index];
            return Expanded(
              //este expanded es para repartir todo el espacio equitativamente entre los hijos de row y de esa forma tener mas espacio de contacto para el boton que se pueda clickear
              child: Container(
                // color: Colors.blue,
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          item.iconPath,
                          width: 35,
                          color: isActive ? Colors.pink : Colors.grey,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          item.label,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: isActive ? Colors.pink : Colors.grey),
                        ),
                      ],
                    ),
                    onPressed: () {
                      changePage(index);
                    }),
              ),
            );
          }),
        ),
      ),
    );
  }
}
