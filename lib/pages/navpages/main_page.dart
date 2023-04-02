import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/favourite_page.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/navpages/search_page.dart';
import 'package:flutter_cubit/state/actions/change-current-index.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../state/AppState.dart';
import '../user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class MainPageState {
  final int index;
  final void Function(int index) changePage;

  MainPageState(this.index, this.changePage);
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    FavouritePage(),
    SearchPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (store) => store.state.navigationBarIndex,
      builder: (_, index) {
        return StoreConnector<AppState, void Function(int index)>(
        converter: (store) => (int index) => store.dispatch(ChangeCurrentIndex(index)),
        builder: (_, changeIndex) {

          return Scaffold(
            backgroundColor: Colors.white,
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              onTap: (index) {
                changeIndex(index);
              },
              currentIndex: index,
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.grey.withOpacity(0.5),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
                BottomNavigationBarItem(label: "Favorite", icon: Icon(Icons.favorite)),
                BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
                BottomNavigationBarItem(label: "My", icon: Icon(Icons.person))
              ],
            ),
          );
      });
    });
  }
}
