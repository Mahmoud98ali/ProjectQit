import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit_test/modules/cubit/cubit.dart';
import 'package:qit_test/modules/cubit/states.dart';
import '../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QitLoginCubit, QitLoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style:
                            Theme.of(context).textTheme.headline5?.copyWith(
                                  fontSize: 65.0,
                                ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Please login to your account",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      defaultFormField(
                        suffixIcon: Icons.email_outlined,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email is must not empty';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(color: Colors.grey),
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultFormField(
                        onSubmit: (value) {
                          if (formKey.currentState!.validate()) {
                            QitLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        isPassword: QitLoginCubit.get(context).isPassword,
                        suffixIcon: QitLoginCubit.get(context).suffix,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password is too short';
                          }
                          return null;
                        },
                        suffixPressed: () {
                          QitLoginCubit.get(context)
                              .ChangePasswordVisibility();
                        },
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        controller: passwordController,
                        // suffixIcon: ShopLoginCubit.get(context).suffix,
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      ConditionalBuilder(
                        condition: state is! QitLoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              QitLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: "login",
                          isUpperCase: true,
                        ),
                      fallback :(context) =>const Center(child:   CircularProgressIndicator(color: Colors.black,)),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 190.0),
                        child: defaultTextButton(
                          onPressed: () {
                            // navigateTo(context, ShopRegisterScreen());
                          },
                          isUpperCase: false,
                          title: "Forget Password?",
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                            const EdgeInsets.only(left: 125.0, top: 40.0),
                        child: Text(
                          'or login with',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
