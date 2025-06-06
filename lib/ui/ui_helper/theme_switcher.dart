import 'package:crypto_provider/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var switchIcon = Icon(
      themeProvider.isDarkMode
          ? CupertinoIcons.moon_fill
          : CupertinoIcons.sun_max_fill,
      color: Colors.white,
    );
    return IconButton(
      onPressed: () {
        themeProvider.toggleTheme();
      },
      icon: switchIcon,
    );
  }
}
