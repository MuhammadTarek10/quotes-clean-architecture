import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';
import 'package:quotes/core/utils/media_query_values.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback? reloadFunction;
  const ErrorView({Key? key, this.reloadFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning,
          color: AppColors.primaryColor,
          size: 150,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            AppStrings.error,
            style: TextStyle(color: AppColors.buttonColor),
          ),
        ),
        const Text(
          AppStrings.tryAgain,
          style: TextStyle(
            color: AppColors.hintColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: 55,
          width: context.width * 0.5,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: AppColors.primaryColor,
              onPrimary: Theme.of(context).primaryColor,
              elevation: 500,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: reloadFunction ?? () {}, 
            child: const Text(
              AppStrings.reload,
              style: TextStyle(
                color: AppColors.buttonColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
