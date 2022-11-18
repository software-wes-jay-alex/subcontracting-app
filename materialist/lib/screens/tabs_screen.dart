import 'package:flutter/material.dart';
import 'package:materialist/widgets/app_bar.dart';
import 'add_task_screen.dart';
import 'completed_tasks_screen.dart';
import 'favorite_tasks_screen.dart';
import 'drawer.dart';
import 'pending_tasks_screen.dart';
import 'package:materialist/services/auth.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = "tabs_screen";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingMatsScreen(), "title": "Unverified Materials"},
    {'pageName': const CompletedMatsScreen(), "title": "Verified Materials"},
    {'pageName': const FavoriteMatsScreen(), "title": "Favorite Materials"},
  ];

  var _selectedPageIndex = 0;

  void _addMaterial(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: ((context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddMatScreen(),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(auth: AuthService()),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                _addMaterial(context);
              },
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_sharp),
              label: 'Unverified Materials'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Verified Materials'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Materials'),
        ],
      ),
    );
  }
}
