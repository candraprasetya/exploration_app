part of '../screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> bottomNavItem = <Widget>[
    'Home'.text.xl2.textStyle(tStyle.bottomNavText).makeCentered(),
    'Feed'.text.xl2.textStyle(tStyle.bottomNavText).makeCentered(),
    'Add'.text.xl2.textStyle(tStyle.bottomNavText).makeCentered(),
    'Course'.text.xl2.textStyle(tStyle.bottomNavText).makeCentered(),
    'Profile'.text.xl2.textStyle(tStyle.bottomNavText).makeCentered(),
  ];

  List<GButton> bottomNavButtonList = <GButton>[
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.dashboard,
      text: 'Feed',
    ),
    GButton(
      icon: Icons.add_circle,
      text: 'Add',
    ),
    GButton(
      icon: Icons.fact_check,
      text: 'Course',
    ),
    GButton(
      icon: Icons.person,
      text: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomNavItem.elementAt(selectedIndex),
      bottomNavigationBar: VxBox(
              child: SafeArea(
        child: GNav(
            textStyle: tStyle.bottomNavText.copyWith(color: colors.primaryBlue),
            color: colors.textGrey,
            rippleColor: colors.semanticGrey,
            hoverColor: colors.semanticGrey,
            gap: 6,
            activeColor: colors.primaryBlue,
            iconSize: 24,
            padding: EdgeInsets.all(16),
            duration: Duration(milliseconds: 300),
            tabs: bottomNavButtonList,
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
      ).pSymmetric(h: 16, v: 8))
          .white
          .withShadow([
        BoxShadow(blurRadius: 20, color: colors.semanticBlack.withOpacity(.1))
      ]).make(),
    );
  }
}
