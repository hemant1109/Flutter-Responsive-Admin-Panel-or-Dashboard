import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuController(),
      child: MaterialApp(
          title: 'Fastest',
          debugShowCheckedModeBanner: false,
          theme:  ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                .apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          home: LoginScreenStateFull()),
    );
  }

}
