import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0; //default index

  List<Widget> _widgetOptions = [
    Text('Home'),
    Text('Account'),
    Text('Bookings'),
    Text('Nearby'),
    Text('Message'),
    Text('Account'),
  ];
  @override
  Widget build(BuildContext context) {
    return CustomLineIndicatorBottomNavbar(
      selectedColor: Colors.purple,
      unSelectedColor: Colors.black54,
      backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      enableLineIndicator: false,
      lineIndicatorWidth: 3,
      indicatorType: IndicatorType.Top,
      customBottomBarItems: [
        CustomBottomBarItems(
          label: 'Home',
          icon: Icons.home,
        ),
        CustomBottomBarItems(
          label: 'Bookings',
          icon: Icons.calendar_month_sharp,
        ),
        CustomBottomBarItems(label: 'Nearby', icon: Icons.location_on),
        CustomBottomBarItems(
          label: 'Message',
          icon: Icons.message,
        ),
        CustomBottomBarItems(
          label: 'Account',
          icon: Icons.account_circle,
        ),
      ],
    );
  }
}
