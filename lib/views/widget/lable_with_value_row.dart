// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LableWithValueRow extends StatelessWidget {
  const LableWithValueRow({
    Key? key,
    required this.lable,
    required this.value,
  }) : super(key: key);
  final String lable;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(lable,
            style:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        Text(value,
            style:
                const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
