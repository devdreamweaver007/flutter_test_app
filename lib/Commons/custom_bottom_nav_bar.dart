import 'package:flutter/material.dart';
import 'package:flutter_test_app/Features/Home/View/home_screen.dart';
import 'package:flutter_test_app/Features/Profile/View/profile_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.assignment_turned_in),
        title: ("Home"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  Future<bool> _onWillPop() async {
    if (_controller.index == 0) {
      return true;
    } else {
      _controller.jumpToTab(0);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: PersistentTabView(
        hideOnScrollSettings: HideOnScrollSettings(hideNavBarOnScroll: true),
        margin: EdgeInsets.all(12),
        navBarHeight: size * .15,
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        stateManagement: true,
        handleAndroidBackButtonPress: false,
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: .03, blurRadius: .2),
          ],
          borderRadius: BorderRadius.circular(15.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style1,
      ),
    );
  }
}

