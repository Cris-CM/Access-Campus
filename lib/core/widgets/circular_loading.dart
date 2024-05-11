import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Opacity(
        opacity: .7,
        child: SizedBox(
          height: 10.w,
          width: 10.w,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
