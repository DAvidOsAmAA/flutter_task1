import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/screens/budget.dart';
import 'package:flutter_application_1/screens/card.dart';
import 'package:flutter_application_1/screens/card2.dart';
import 'package:flutter_application_1/screens/user.dart';
import 'package:flutter_application_1/screens/wallet.dart';
import 'package:flutter_application_1/shared/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({Key? key}) : super(key: key);

  @override
  State<Navigationbar> createState() => _NavigationbarState();
}



class _NavigationbarState extends State<Navigationbar> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        // onPageChanged: (index) {},
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [wallet(), user(), card2(), card(), budget()],
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            _selectedIndex = index;
          });
        },
        activeColor: blueColor, 
        inactiveColor: primaryColor, 
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            label: "Wallet",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/wallet.svg",
                color: _selectedIndex == 0 ? Colors.blue : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Budget",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/messenger.svg",
                color: _selectedIndex == 1 ? Colors.blue : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Card",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/paper.svg",
                color: _selectedIndex == 2 ? Colors.blue : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Card",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/arrows.svg",
                color: _selectedIndex == 3 ? Colors.blue : Colors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                "assets/user.svg",
                color: _selectedIndex == 4 ? Colors.blue : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
