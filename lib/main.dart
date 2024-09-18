import 'package:flutter/material.dart';
import 'package:flutter_mix_tutorial/home_page.dart';
import 'package:flutter_mix_tutorial/theme_data.dart';
import 'package:mix/mix.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MixTheme(
      data: customThemeData,
      child: const MaterialApp(
        title: 'Flutter Mix',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
