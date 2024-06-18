part of '_index.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 20,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_today,
            size: 20,
          ),
          label: 'Schedule',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            size: 20,
          ),
          label: 'Settings',
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => _onItemTapped(index),
    );
  }
}
