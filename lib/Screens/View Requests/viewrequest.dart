// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ViewRequest extends StatelessWidget {
  const ViewRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'ViewRequest Page',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );
  }
}
