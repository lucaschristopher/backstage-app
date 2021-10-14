import 'package:backstage_app/app/modules/home/screens/calendar_page.dart';
import 'package:backstage_app/app/modules/home/screens/event_page.dart';
import 'package:backstage_app/app/modules/home/screens/organization_page.dart';
import 'package:backstage_app/app/shared/utils/components/header_app_name.dart';
import 'package:backstage_app/app/shared/utils/constants/app_colors.dart';
import 'package:backstage_app/app/shared/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: store.currentPage);
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 1- Home (calendário, listagem dos próximos eventos, etc)
     * 2- Listagem de todos os eventos
     * 3- Listagem das organizações que você tem/participa
     */

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: HeaderAppName(),
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          CalendarPage(),
          EventPage(),
          OrganizationPage(),
        ],
        onPageChanged: store.setCurrentPage,
      ),
      bottomNavigationBar: Observer(
        builder: (_) => renderBottomNavigationBar(),
      ),
    );
  }

  Widget renderBottomNavigationBar() {
    return BottomNavigationBar(
      selectedLabelStyle: const TextStyle(
        fontFamily: "Montserrat",
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: "Montserrat",
      ),
      elevation: 0.0,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.unselectedItemColor,
      backgroundColor: AppColors.backgroundColor,
      currentIndex: store.currentPage,
      items: const [
        BottomNavigationBarItem(
          label: AppStrings.home,
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: AppStrings.events,
          icon: Icon(Icons.date_range_sharp),
        ),
        BottomNavigationBarItem(
          label: AppStrings.organizations,
          icon: Icon(Icons.people_alt_outlined),
        ),
      ],
      onTap: (page) {
        _pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        );
      },
    );
  }
}
