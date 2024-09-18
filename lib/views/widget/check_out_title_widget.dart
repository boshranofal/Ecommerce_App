// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckOutTitleWidget extends StatefulWidget {
  final String title;
  final int? numOfItems;
  final VoidCallback onTap;

  const CheckOutTitleWidget({
    Key? key,
    required this.title,
    this.numOfItems,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CheckOutTitleWidget> createState() => _CheckOutTitleWidgetState();
}

class _CheckOutTitleWidgetState extends State<CheckOutTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (widget.numOfItems != null)
            Text(
              '${widget.numOfItems} items',
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
        ]),
        TextButton(
          onPressed: widget.onTap,
          child: const Text(
            'Edit',
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
