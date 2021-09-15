import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool debugPrint = true;

lPrint(dynamic log) {
  if (debugPrint) print('$log');
}

class DialogHelper {
  static showDialog({
    String title = 'Quiz App',
    String message = 'Some message',
    bool close = false,
    bool dismis = true,
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                message ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen) if (close)
                    Get.close(2);
                  else
                    Get.back();
                },
                child: Text('Okay'),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: dismis ? true : false,
    );
  }
}
