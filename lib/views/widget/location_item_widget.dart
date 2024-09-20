// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/address_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class LocationItemWidget extends StatefulWidget {
  final AddressModel? location;
  const LocationItemWidget({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  State<LocationItemWidget> createState() => _LocationItemWidgetState();
}

class _LocationItemWidgetState extends State<LocationItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: widget.location == null
                    ? Column(
                        children: [
                          const Text('No address available!'),
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AppRoutes.address),
                            child: const Text('Add New Address'),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: 12,
                      )
                // : Row(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Image.network(
                //           widget.location.imgUrl,
                //           width: 100,
                //           height: 100,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       const SizedBox(width: 10),
                //       Column(
                //         children: [
                //           Text(
                //             widget.location.name,
                //             style: const TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             widget.location.address,
                //             style: const TextStyle(
                //               fontSize: 16,
                //               color: AppColors.grey,
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   )
                )));
  }
}
