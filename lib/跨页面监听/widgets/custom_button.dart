import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final RxBool isButtonEnabled;

  const CustomButton({super.key, 
    required this.onPressed,
    required this.isButtonEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        onPressed: isButtonEnabled.value ? onPressed : null,
        child: const Text('Submit'),
      );
    });
  }
}
