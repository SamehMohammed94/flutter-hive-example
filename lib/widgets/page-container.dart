import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: child,
    );
  }
}
