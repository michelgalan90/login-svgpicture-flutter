import 'package:flutter/material.dart';
import 'package:my_app_2/src/pages/chat_page.dart';
import 'package:my_app_2/src/pages/image_page.dart';
import 'package:my_app_2/src/pages/page_home_tabs/history_tab.dart';
import 'package:my_app_2/src/pages/page_home_tabs/home_tab.dart';
import 'package:my_app_2/src/pages/page_home_tabs/more_tab.dart';
import 'package:my_app_2/src/pages/page_home_tabs/oferts_tab.dart';
import 'package:my_app_2/src/pages/post_page.dart';
import 'package:my_app_2/src/widgets/avatar.dart';

import 'package:my_app_2/src/widgets/bottom_menu.dart';
import 'package:my_app_2/src/widgets/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app_2/src/widgets/cronometro.dart';
import 'package:my_app_2/src/widgets/my_appbar.dart';
import 'package:my_app_2/src/widgets/my_btn.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  final lista = [HomeTab(), HistoryTab(), OfertsTab(), MoreTab()];
  /* final PageController pageController = PageController(
      keepPage:
          true); //el initialPage del controller por default es 0 no es necesario especificarlo para cuando vuelva a entrarse a la pagina del home que no explote. */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomMenu(
        changePage: (page) {
          setState(() {
            _currentPage =
                page; //aca es redundante ahora mismo porque el animateToPage se encarga de que la pagina del PageView cambie y entonces en su PageView.builder la propiedad onPageChanged recibe el indice de la pagina a la que va y esta haciendo un setState al _currentPage por lo tanto se redibuja el builder y se pasa el nuevo _currentPage
            /*   pageController.animateToPage(page,
                duration: Duration(seconds: 1), curve: Curves.easeOutCubic); */
            // pageController.jumpToPage(page);
            print(_currentPage);
          });
        },
        currentPage: _currentPage,
        items: [
          BottomMenuItem(iconPath: 'assets/icons/house.svg', label: 'Inicio'),
          BottomMenuItem(
              iconPath: 'assets/icons/clock.svg', label: 'Historial'),
          BottomMenuItem(
              iconPath: 'assets/icons/shopping-cart.svg', label: 'Ofertas'),
          BottomMenuItem(iconPath: 'assets/icons/user.svg', label: 'Mas'),
        ],
      ),
      body: SafeArea(
        // top: true,
        // bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              // appBar
              MyAppbar(
                rightIcon:
                    'https://www.flaticon.com/svg/static/icons/svg/1041/1041916.svg',
                leftIcon:
                    'https://www.flaticon.com/svg/static/icons/svg/3112/3112977.svg',
                onRightClick: () {
                  final route = MaterialPageRoute(builder: (BuildContext _) {
                    return ChatPage(
                      userName: 'Michel Galan',
                    );
                  });
                  Navigator.push(context, route);
                },
                onLeftClick: () {
                  Navigator.pushNamed(context, ImagePage.routeName,
                      arguments:
                          ImagesPageArgs(username: 'Michel', isActive: true));
                },
              ),
              Expanded(
                child: IndexedStack(
                  children: lista,
                  index: _currentPage,
                ),
                // child: Center(),
                /* child: Center(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: PageView(
                      children: lista,
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                    ),
                  ),
                ), */
              ),
            ],
          ),
        ),
      ),
      /*  child: Text(
          'Hello Devs',
          style: TextStyle(color: Colors.red.withOpacity(1.0)),
        ), */

      /*    BoxShadow(
                color: Colors.red.withOpacity(0.5),
                blurRadius: 20,
                offset: Offset(10, 10),
              ), */
    );
  }
}
