import 'package:flutter/material.dart';
import 'screens/ask_out_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const AskMeOutApp());
}

class AskMeOutApp extends StatelessWidget {
  const AskMeOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Will You Go Out With Me? 💕',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.rose),
        fontFamily: 'Georgia',
      ),
      home: const AskOutScreen(),
    );
  }
}
