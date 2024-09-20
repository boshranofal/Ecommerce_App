import 'package:ecommerce_app/views_models/cubit/check_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayMentDetails extends StatefulWidget {
  const PayMentDetails({super.key});

  @override
  State<PayMentDetails> createState() => _PayMentDetailsState();
}

class _PayMentDetailsState extends State<PayMentDetails> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final paymentcubit = BlocProvider.of<CheckOutCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // الإشعارات
            },
          ),
        ],
      ),
      body: BlocBuilder<CheckOutCubit, CheckOutState>(
          bloc: paymentcubit,
          builder: (context, state) {
            if (state is PaymentLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is PaymentError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is PaymentLoaded) {
              final totalAmount = state.total;
              final cartOrders = state.cart;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // PageView للبطاقات
                    SizedBox(
                      height: 200,
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            currentIndex = index; // تحديث البطاقة الحالية
                          });
                        },
                        children: [
                          Image.network(
                            'https://pngimg.com/uploads/credit_card/credit_card_PNG37.png',
                            fit: BoxFit.cover,
                          ),
                          Image.network(
                              'https://www.edigitalagency.com.au/wp-content/uploads/PayPal-logo-PNG.png'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // مؤشر لعدد البطاقات
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(2, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: currentIndex == index ? 12 : 8,
                          height: currentIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index
                                ? Colors.orange
                                : Colors.grey,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),
                    // زر إضافة بطاقة
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        // وظيفة إضافة بطاقة
                      },
                      child: const Text(
                        'Add Card',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${cartOrders.length} items'),
                        Text('\$${totalAmount - 10}'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount'),
                        Text('10%'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery'),
                        Text('\$${10.00} '),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '$totalAmount',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // زر الطلب
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.orange,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }

  // دالة لبناء البطاقات
}
