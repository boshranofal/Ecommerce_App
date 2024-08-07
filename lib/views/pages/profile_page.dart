import 'package:ecommerce_app/models/profile_models.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "General",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        dummygeneral[index].title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      leading: Icon(dummygeneral[index].icon),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            dummygeneral[index].icon2,
                            color: AppColors.grey,
                          )),
                    ),
                  );
                },
              ),
              //const SizedBox(height: 8),
              const Text("Preferences",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: dummyprefer.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        dummyprefer[index].title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      leading: Icon(dummyprefer[index].icon),
                      trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            dummyprefer[index].icon2,
                            color: AppColors.grey,
                          )),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
