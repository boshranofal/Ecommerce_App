import 'package:flutter/material.dart';

class PayMentDetails extends StatelessWidget {
  const PayMentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Details'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              PageView.custom(
                  childrenDelegate: SliverChildListDelegate([
                Text('Payment Details'),
                Text('Payment Details'),
                Text('Payment Details'),
              ])),
            ],
          ),
        ));
  }
}
