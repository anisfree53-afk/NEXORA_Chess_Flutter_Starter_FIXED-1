import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'theme/app_theme.dart';

class NexoraChessApp extends StatelessWidget {
  const NexoraChessApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'NEXORA Chess',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.dark,
    home: const LoginScreen(),
    routes: {'/home': (_) => const HomeScreen()},
  );
}
