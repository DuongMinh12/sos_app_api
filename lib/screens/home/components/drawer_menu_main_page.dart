import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/menu_item_model.dart';
import 'package:warning_app/screens/home/components/drawer_menu_change_page.dart';
import 'package:warning_app/screens/screens.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);
 static String routeName ='drawerMenu';
  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  MenuItem currentItem = MenuItems.home;
  //late MenuItem currentItem;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      showShadow: true,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      angle: -5,
      menuBackgroundColor: kMainColor, //Colors.blueAccent.withAlpha(100),
      // menuBackgroundColor: Colors.blue,
      mainScreenTapClose: true,
      //menuScreenTapClose: true,
      menuScreen: Builder(
        builder: (context) => MenuBody(
          onSelectItem: (item) {
            setState(() => currentItem = item);
            ZoomDrawer.of(context)!.close();
          },
          currentItem: currentItem,
        ),
      ),
      mainScreen: getScreen(),
      style: DrawerStyle.defaultStyle,
      //borderRadius: 30,
    );
  }

  getScreen() {
    if (currentItem == MenuItems.home) {
      return BodyHomePage();
    }
    if (currentItem == MenuItems.profile) {
      return ProfilePage();
    }
    if (currentItem == MenuItems.help) {
      return ContactPage();
    }
    if (currentItem == MenuItems.test) {
      return TestPage();
    }
  }
}
