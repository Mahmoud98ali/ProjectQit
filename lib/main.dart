import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qit_test/shared/network/remote/dio_helper.dart';

import 'modules/cubit/cubit.dart';
import 'modules/cubit/states.dart';
import 'modules/login_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => QitLoginCubit(),
      child: BlocConsumer<QitLoginCubit, QitLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );


  }
}



