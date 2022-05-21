import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPipe extends StatelessWidget {
  const MyPipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60, height: 60, child: Image.asset('images/hookah.png'));
  }
}
