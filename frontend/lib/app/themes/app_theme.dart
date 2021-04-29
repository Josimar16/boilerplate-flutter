import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/app/themes/app_colors.dart';

class AppTheme with ChangeNotifier {
  final BuildContext context;
  AppTheme(this.context);
  ThemeData get defaultTheme => ThemeData(
        primaryColor: AppColors.primary,
        accentColor: AppColors.accent,
        brightness: Brightness.dark,
        // textTheme: GoogleFonts.muliTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
