import 'package:ecommerce_app/models/profile_models.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views_models/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_app/views_models/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profilecubit = BlocProvider.of<ProfileCubit>(context);
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is ProfileLoaded ||
          current is ProfileLoading ||
          current is ProfileError,
      bloc: profilecubit,
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is ProfileLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
              centerTitle: true,
              leading: const Icon(Icons.arrow_back_rounded),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "General",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      bloc: authCubit,
                      listenWhen: (previous, current) =>
                          current is SiginedOut || current is AuthError,
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacementNamed(AppRoutes.signin);
                        } else if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            backgroundColor: AppColors.red,
                          ));
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is SiginingOut ||
                          current is SiginedOut ||
                          current is AuthError,
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  dummygeneral[index].title,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                leading: IconButton(
                                    icon: dummygeneral[index].icon.icon,
                                    onPressed: () {}),
                                trailing: IconButton(
                                    icon: Icon(dummygeneral[index].icon2,
                                        color: AppColors.grey),
                                    onPressed: () {}),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Preferences",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    BlocConsumer<AuthCubit, AuthState>(
                      bloc: authCubit,
                      listenWhen: (previous, current) =>
                          current is SiginedOut || current is AuthError,
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacementNamed(AppRoutes.signin);
                        } else if (state is AuthError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            backgroundColor: AppColors.red,
                          ));
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is SiginingOut ||
                          current is SiginedOut ||
                          current is AuthError,
                      builder: (context, state) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dummyprefer.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  dummyprefer[index].title,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                leading: IconButton(
                                  icon: dummyprefer[index].icon.icon,
                                  onPressed: () {},
                                ),
                                trailing: IconButton(
                                  icon: Icon(dummyprefer[index].icon2,
                                      color: AppColors.grey),
                                  onPressed: state is SiginingOut
                                      ? null
                                      : () {
                                          if (dummyprefer[index].title ==
                                              'Logout') {
                                            authCubit.signOut();
                                          }
                                        },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
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
