import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:ecommerce_app/views_models/home_tap_cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatugoryTabInner extends StatelessWidget {
  const CatugoryTabInner({super.key});

  @override
  Widget build(BuildContext context) {
    final categortTabCubit = BlocProvider.of<HomeTapCubit>(context);
    return BlocBuilder<HomeTapCubit, HomeTapState>(
      bloc: categortTabCubit,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: dummyCategories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        height: 130,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dummyCategories[index].name,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  // Add other details if needed
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Image.asset(
                                dummyCategories[index].imgUrl,
                                height: 120,
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
