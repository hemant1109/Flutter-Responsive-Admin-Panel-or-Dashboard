import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      //drawer: SideMenu(),
      body: WillPopScope(
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              // if (Responsive.isDesktop(context))
              //   Expanded(
              //     // default flex = 1
              //     // and it takes 1/6 part of the screen
              //     child: SideMenu(),
              //   ),
              Expanded(
                // It takes 5/6 part of the screen
                // flex: 1,
                child: DashboardScreen(),
              ),
            ],
          ),
        ),
        onWillPop: () async => false,// disable back button of chrome
      ),
    );
  }
}
