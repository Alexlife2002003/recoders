import 'package:flutter/material.dart';
import 'package:recoders/screens/about_us.dart';
import 'package:recoders/screens/explore_page.dart';
import 'package:recoders/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recoders',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff7a6ac5),
          onPrimary: Color(0xff7a6ac5),
          secondary: Color(0xff7a6ac5),
          onSecondary: Color(0xff7a6ac5),
          error: Color(0xff7a6ac5),
          onError: Color(0xff7a6ac5),
          background: Colors.white,
          onBackground: Color(0xff7a6ac5),
          surface: Color(0xff6a69ce),
          onSurface: Colors.white,
        ),
        canvasColor: Colors.grey[300],
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Define your pages/screens here
  final List<Widget> _pages = [
    const home_page(),
    ExplorePage(),
    ProfileScreen(),
    const AboutUs()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0),
        child: AppBar(
          backgroundColor: const Color(0xFF1A1F33),
          centerTitle: true,
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.podcasts),
            label: 'Podcast',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'About us',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Screen'),
    );
  }
}
