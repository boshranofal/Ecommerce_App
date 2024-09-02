import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/views/widget/main_button.dart';
import 'package:ecommerce_app/views_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSecured = true;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Login Account",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text("Please login with registered account",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.grey,
                      )),
              const SizedBox(height: 36),
              Text("Email",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  RegExp regex = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
                  if (value!.isEmpty) {
                    return "Email is required";
                  } else if (!regex.hasMatch(value)) {
                    return "Invalid email";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              Text("Password",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              const SizedBox(height: 8),
              TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  } else if (!value.contains(RegExp(r'[A-Z]'))) {
                    return "Password must contain at least one uppercase letter";
                  } else if (!value.contains(RegExp(r'[0-9]'))) {
                    return "Password must contain at least one number";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),

                  prefixIcon: const Icon(Icons.lock_outline),
                  prefixIconColor: AppColors.grey5,
                  //suffixIconColor: AppColors.grey5
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isSecured = !isSecured;
                      });
                    },
                    icon: isSecured
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              BlocConsumer<AuthCubit, AuthState>(
                bloc: authCubit,
                listenWhen: (previous, current) =>
                    current is AuthError || current is AuthSuccess,
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushReplacementNamed(context, AppRoutes.home);
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: AppColors.red,
                    ));
                  }
                },
                buildWhen: (previous, current) =>
                    current is AuthLoading ||
                    current is AuthError ||
                    current is AuthSuccess,
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return MainButton(
                      label: "Login",
                      isLoading: true,
                      onPressed: () {},
                    );
                  }
                  return MainButton(
                    label: "Login",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await authCubit.signIn(
                            emailController.text, passwordController.text);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
