import 'package:backstage_app/app/modules/auth/auth_store.dart';
import 'package:backstage_app/app/shared/utils/components/logo_app.dart';
import 'package:backstage_app/app/shared/utils/constants/app_colors.dart';
import 'package:backstage_app/app/shared/utils/constants/app_strings.dart';
import 'package:backstage_app/app/shared/utils/constants/font_sizes.dart';
import 'package:backstage_app/app/shared/utils/exceptions/auth_exception.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final store = Modular.get<AuthStore>();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: GestureDetector(
        onTap: () {
          // Hides the keyboard if it is open when clicking on the screen
          // FocusManager.instance.primaryFocus.unfocus();
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: renderBody(),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget renderBody() {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          const LogoApp(),
          // Form
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 24.0,
                    right: 24.0,
                    bottom: 24.0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // E-mail field
                        emailInputLabel(),
                        emailTextInput(),
                        const SizedBox(height: 20.0),
                        // E-mail field
                        userInputLabel(),
                        userTextInput(),
                        const SizedBox(height: 20.0),
                        // Password field
                        passwordInputLabel(),
                        passwordTextInput(),
                        const SizedBox(height: 20.0),
                        // Repat Password field
                        repeatPasswordInputLabel(),
                        repeatPasswordTextInput(),
                        const SizedBox(height: 40.0),
                        // Login button
                        signUpButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget emailInputLabel() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppStrings.emailLabel,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.formLabel,
        ),
      ),
    );
  }

  Widget userInputLabel() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppStrings.userLabel,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.formLabel,
        ),
      ),
    );
  }

  Widget passwordInputLabel() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppStrings.passwordLabel,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.formLabel,
        ),
      ),
    );
  }

  Widget repeatPasswordInputLabel() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        AppStrings.repeatPasswordLabel,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: FontSize.formLabel,
        ),
      ),
    );
  }

  Widget emailTextInput() {
    return TextFormField(
      style: const TextStyle(
          color: Colors.white,
          fontFamily: "Product Sans",
          decorationColor: Colors.green),
      controller: _emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColors.inputTextBackgroundColor,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.emailInputInfoText;
        }
        return null;
      },
    );
  }

  Widget userTextInput() {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontFamily: "Product Sans",
      ),
      controller: _userController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColors.inputTextBackgroundColor,
      ),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.nicknameInputInfoText;
        }
        return null;
      },
    );
  }

  Widget passwordTextInput() {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontFamily: "Product Sans",
      ),
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColors.inputTextBackgroundColor,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.passwordInputInfoText;
        } else if (value.length < 6) {
          return AppStrings.passwordInputInfoTextSize;
        }
        return null;
      },
    );
  }

  Widget repeatPasswordTextInput() {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontFamily: "Product Sans",
      ),
      controller: _repeatPasswordController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: AppColors.inputTextBackgroundColor,
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.passwordInputInfoText;
        } else if (value != _passwordController.text) {
          return AppStrings.passwordsDoNotMatchInfo;
        }
        return null;
      },
    );
  }

  Widget signUpButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.065,
      child: Observer(
        builder: (_) {
          return ElevatedButton(
            child: (store.isLoading)
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    AppStrings.loginButtonText,
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
            onPressed: () => signUp(),
          );
        },
      ),
    );
  }

  void signUp() async {
    // Hide keyboard
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }

    try {
      if (_formKey.currentState!.validate()) {
        String email = _emailController.text.trim();
        String password = _passwordController.text.trim();
        await store.signUp(email, password);
      }
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message)),
      );
    } finally {
      clearFormFields();
    }
  }

  void clearFormFields() {
    _emailController.clear();
    _passwordController.clear();
    _repeatPasswordController.clear();
  }
}
