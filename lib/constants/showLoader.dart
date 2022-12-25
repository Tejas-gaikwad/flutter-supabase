import 'package:flutter/material.dart';
import 'package:supabase_hackathon/constants/constant.dart';

class Loader {
  showLoaderNow(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: Alignment.center,
          content: Container(
            height: 50,
            width: 50,
            child: Center(
              child: const CircularProgressIndicator(
                color: primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
