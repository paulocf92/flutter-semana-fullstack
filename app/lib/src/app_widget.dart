import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/configuration_page.dart';
import 'package:listinha/src/home/edit_task_board_page.dart';
import 'package:listinha/src/home/home_page.dart';

import 'shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const HomePage(),
        '/edit': (context) => const EditTaskBoardPage(),
        '/config': (context) => const ConfigurationPage(),
      },
    );
  }
}
