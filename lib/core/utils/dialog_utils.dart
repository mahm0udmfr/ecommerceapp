import 'package:ecommerceapp/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context, required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: AppStyles.regular18White,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

static  void showMessage(
      {required BuildContext context,
      required String message,
      String? title,
      String? posActionName,
      Function? posAction,
      Function? negAction,
      String? negActionName}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(
            posActionName,
            style: AppStyles.regular18White,
          )));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negAction?.call();
          },
          child: Text(
            negActionName,
            style: AppStyles.regular18White,
          )));
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message,style: AppStyles.regular18White,),
          title: Text(
            title ?? 'Title',
            style: AppStyles.regular18White,
          ),
          actions: actions,
        );
      },
    );
  }
}
