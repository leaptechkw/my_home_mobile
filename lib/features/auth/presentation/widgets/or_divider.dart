import 'package:flutter/material.dart';
import 'package:my_home/core/utils/spacing.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider()),
        horizontalSpace(5),
        Text('OR'),
        horizontalSpace(5),
        horizontalSpace(5),
        Expanded(child: Divider()),
      ],
    );
  }
}
