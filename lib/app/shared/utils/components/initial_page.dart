import 'package:backstage_app/app/modules/auth/screens/login_page.dart';
import 'package:backstage_app/app/modules/auth/screens/signup_page.dart';
import 'package:backstage_app/app/shared/utils/components/logo_app.dart';
import 'package:backstage_app/app/shared/utils/constants/app_colors.dart';
import 'package:backstage_app/app/shared/utils/constants/font_sizes.dart';
import 'package:backstage_app/app/shared/utils/constants/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Center(
              child: LogoApp(),
            ),
            const SizedBox(height: 20.0),
            descriptionText(),
            const SizedBox(height: 30.0),
            goToSignUpPageButton(),
            goToLoginPageButton(),
          ],
        ),
      ),
    );
  }

  Widget descriptionText() {
    return const Text(
      AppStrings.initialDescription,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: "Product Sans",
        fontSize: FontSize.medium,
      ),
    );
  }

  Widget goToSignUpPageButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      child: ElevatedButton(
        child: const Text(
          AppStrings.signUpButtonText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          textStyle: const TextStyle(
            fontSize: FontSize.big,
          ),
          primary: AppColors.signUpButtonColor,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        ),
      ),
    );
  }

  Widget goToLoginPageButton() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 100.0,
        top: 20.0,
      ),
      child: TextButton(
        child: const Text(
          AppStrings.loginButtonText,
          style: TextStyle(
            fontFamily: "Product Sans",
            fontSize: FontSize.medium,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        ),
      ),
    );
  }
}
