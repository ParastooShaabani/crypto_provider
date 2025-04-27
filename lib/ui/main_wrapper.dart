import 'package:crypto_provider/ui/home_page.dart';
import 'package:crypto_provider/ui/ui_helper/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final PageController _materPageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(Icons.compare_arrows_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(pageController: _materPageController),
      body: PageView(
        controller: _materPageController,
        children: [HomePage(), MarketPage(), ProfilePage(), SettingPage()],
      ),
    );
  }
}



class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('MarketPage')));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('ProfilePage')));
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('SettingPage')));
  }
}
