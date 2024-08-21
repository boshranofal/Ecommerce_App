// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    Key? key,
    required this.color,
    required this.isSelect,
  }) : super(key: key);
  final Color color;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: isSelect ? Colors.grey : color,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: color,
      ),
    );
  }
}
