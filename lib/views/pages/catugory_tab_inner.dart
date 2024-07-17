import 'package:ecommerce_app/models/catugory_models.dart';
import 'package:flutter/material.dart';

class CatugoryTabInner extends StatelessWidget {
  const CatugoryTabInner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: dummyCategories.length,
          itemBuilder: (context, index) {
            return Card(
                child: Container(
                    height: 130,
                    width: double.infinity,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              dummyCategories[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              dummyCategories[index].imgUrl,
                              height: 120,
                              //width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     dummyCategories[index].name,
                        //     style: const TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                      ],
                    )));
          },
        )),
      ],
    );
  }
}
