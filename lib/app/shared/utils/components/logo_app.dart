import 'package:backstage_app/app/shared/utils/constants/font_sizes.dart';
import 'package:backstage_app/app/shared/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.appName,
        style: TextStyle(
          fontFamily: "Montserrat",
          color: Colors.white,
          fontSize: FontSize.biggest,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
