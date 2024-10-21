import 'package:flutter/material.dart';
import 'package:test_quran_app/Views/main_view.dart';
import 'package:test_quran_app/utils/ApiService.dart';

void main() async {
  await DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}
