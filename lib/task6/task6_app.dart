import 'package:flutter/material.dart';
import 'package:flutter_study/task6/favorite_store_model.dart';
import 'package:flutter_study/task6/favorites_screen.dart';
import 'package:flutter_study/task6/news_screen.dart';
import 'package:provider/provider.dart';

class Task6App extends StatefulWidget {
  const Task6App({super.key});

  @override
  State<Task6App> createState() => _Task6AppState();
}

class _Task6AppState extends State<Task6App> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 6: News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        bottomNavigationBar: navigationBarBuild(),
        body: IndexedStack(
          index: _currentTab,
          children: const [
            NewsScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }

  Widget navigationBarBuild() {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      ],
      onTap: (index) {
        setState(() {
          _currentTab = index;
        });
      },
    );
  }
}
