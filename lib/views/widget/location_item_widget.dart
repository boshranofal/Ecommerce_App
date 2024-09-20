// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/widgets.dart';

class LocationItemWidget extends StatelessWidget {
  final AddressModel location;
  const LocationItemWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            location.imgUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(
              location.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              location.address,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
