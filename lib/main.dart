import 'package:appidea/pages/flutterPages.dart';
import 'package:appidea/pages/otherPage.dart';
import 'package:appidea/pages/pageProducts.dart';
import 'package:appidea/pages/pageClients.dart';
import 'package:appidea/pages/pagePlace.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(const MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  final PageProducts _listProducts = const PageProducts();
  final PageClients _clients = const PageClients();
  final PagePlace _sites = const PagePlace();
  final FlutterPages _flutterpages = const FlutterPages();
  final OtherPage _other = const OtherPage();

  Widget _showPage = const PageProducts();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _listProducts;
      case 1:
        return _clients;
      case 2:
        return _sites;
      case 3:
        return _flutterpages;
      case 4:
        return _other;
      default:
        return const Center(
          child: Text(
            'No ha seleccionado ninguna pagina',
            style: TextStyle(fontSize: 30),
          ),
        );
    }
  }

  // ignore: prefer_final_fields
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.calendar_today, size: 30),
            Icon(Icons.live_tv, size: 30),
            Icon(Icons.call, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(child: _showPage),
        ));
  }
}
