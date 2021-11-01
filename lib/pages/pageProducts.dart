import 'package:flutter/material.dart';

class PageProducts extends StatelessWidget {
  const PageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
          alignment: Alignment.center,
          child: Image.asset('assets/croppedicon.png')),
    );
  }
}
