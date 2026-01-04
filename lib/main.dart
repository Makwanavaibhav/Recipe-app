import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/recipe_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        title: 'Recipe Finder',
        theme: ThemeData(
          useMaterial3: true,
          // build a warm, natural palette centered on teal with orange accents
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C), brightness: Brightness.light).copyWith(
            primary: const Color(0xFF00695C), // teal
            onPrimary: Colors.white,
            secondary: const Color(0xFFFB8C00), // orange (for warnings / accents)
            tertiary: const Color(0xFF43A047), // green (for positive badges)
            error: const Color(0xFFD32F2F),
            surface: Colors.white,
          ),
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          ),




          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            bodyMedium: const TextStyle(fontSize: 14),
            bodySmall: const TextStyle(fontSize: 12),
            headlineSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
