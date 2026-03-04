import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/presentation/home/premium_home_screen.dart';

class VadakaraConnectApp extends StatelessWidget {
  const VadakaraConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vadakara Connect',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const PremiumHomeScreen(),
    );
  }
}
