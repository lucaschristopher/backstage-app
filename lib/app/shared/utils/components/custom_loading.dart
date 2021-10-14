import 'package:backstage_app/app/shared/utils/constants/app_colors.dart';
import 'package:backstage_app/app/shared/utils/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Constants.loadingWidth,
        height: Constants.loadingHeight,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.signUpButtonColor,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            strokeWidth: Constants.strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
