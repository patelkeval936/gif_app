import 'package:flutter/material.dart';
import 'package:gif_app/providers/theme_provider.dart';
import 'package:gif_app/utils/app_strings.dart';
import 'package:gif_app/utils/app_theme.dart';
import 'package:gif_app/view/screens/trending_gif_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(),
      child: Builder(builder: (context) {
        return Selector<ThemeProvider, bool>(
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              title: AppStrings.appName,
              theme: AppTheme.themeData(value, context),
              debugShowCheckedModeBanner: false,
              home: const TrendingGifsScreens(),
            );
          },
          selector: (context, themeProvider) {
            return themeProvider.isDarkMode;
          },
        );
      }),
    );
  }
}
