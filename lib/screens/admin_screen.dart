import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:liisma1/screens/side_bar_screen/cards_screen.dart';
import 'package:liisma1/screens/side_bar_screen/card_screen.dart';
import 'package:liisma1/screens/side_bar_screen/dashboard_screen.dart';
import 'package:liisma1/screens/side_bar_screen/library_screen%20.dart';
import 'package:liisma1/screens/side_bar_screen/share_book_screen%20.dart';
import 'package:liisma1/screens/side_bar_screen/tablet_screen.dart';
import 'package:liisma1/screens/side_bar_screen/tablets_screen.dart';
import 'package:liisma1/screens/side_bar_screen/gifts_screen.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Widget _selectedItem = DashboardScreen();
  screenSelector(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedItem = DashboardScreen();
        });
        break;
      case CardScreen.routeName:
        setState(() {
          _selectedItem = CardScreen();
        });
        break;
      case TabletScreen.routeName:
        setState(() {
          _selectedItem = TabletScreen();
        });
        break;
      case TabletsScreen.routeName:
        setState(() {
          _selectedItem = TabletsScreen();
        });
        break;
      case CardsScreen.routeName:
        setState(() {
          _selectedItem = CardsScreen();
        });
        break;
      case GiftsScreen.routeName:
        setState(() {
          _selectedItem = GiftsScreen();
        });
        break;
      case LibraryScreen.routeName:
        setState(() {
          _selectedItem = LibraryScreen();
        });
        break;
      case ShareBookScreen.routeName:
        setState(() {
          _selectedItem = ShareBookScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.yellow.shade300,
      appBar: AppBar(
        title: Text('Admin'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: DashboardScreen.routeName,
            icon: Icons.dashboard,
            children: [
              AdminMenuItem(
                  title: 'Cards',
                  route: CardsScreen.routeName,
                  icon: Icons.card_membership_rounded),
              AdminMenuItem(
                  title: 'Tablets',
                  route: TabletsScreen.routeName,
                  icon: Icons.safety_check),
            ],
          ),
          AdminMenuItem(
            title: 'Progress',
            icon: Icons.abc_rounded,
            children: [
              AdminMenuItem(
                  title: 'Card',
                  route: CardScreen.routeName,
                  icon: Icons.card_membership_rounded),
              AdminMenuItem(
                  title: 'Tablet',
                  route: TabletScreen.routeName,
                  icon: Icons.safety_check),
              AdminMenuItem(
                title: 'Stream',
                icon: Icons.stream_rounded,
                children: [
                  AdminMenuItem(
                      title: 'card',
                      route: CardScreen.routeName,
                      icon: Icons.call_received_rounded),
                  AdminMenuItem(
                      title: 'gifts',
                      route: GiftsScreen.routeName,
                      icon: Icons.card_giftcard_rounded),
                ],
              ),
            ],
          ),
          AdminMenuItem(
            title: 'Library share',
            icon: Icons.add_rounded,
            route: TabletsScreen.routeName,
            children: [
              AdminMenuItem(
                  title: 'Library',
                  route: LibraryScreen.routeName,
                  icon: Icons.library_books_rounded),
              AdminMenuItem(
                  title: 'Share',
                  route: ShareBookScreen.routeName,
                  icon: Icons.bookmark_add_rounded),
            ],
          )
        ],
        selectedRoute: '/',
        onSelected: (item) {
          screenSelector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              '1asaas',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'library',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: _selectedItem,
    );
  }
}
