import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/CubitExample.dart';
import 'package:flutter_bloc_provider_example/bloc/form_validation_bloc/signin_bloc.dart';
import 'package:flutter_bloc_provider_example/bloc/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_provider_example/cubit/internet_cubit.dart';
import 'package:flutter_bloc_provider_example/data/models/PostModel.dart';
import 'package:flutter_bloc_provider_example/data/repository/post_repository.dart';
import 'package:flutter_bloc_provider_example/form_validation_using_bloc.dart';
import 'package:flutter_bloc_provider_example/logic/cubit/post_cubit/post_cubit.dart';
import 'package:flutter_bloc_provider_example/routes/routes.dart';

import 'bloc/home_page_block_listener_example.dart';
import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => InternetBloc(),
      // create: (context) => InternetCubit(),
      // create: (context) => SignInBloc(),
      create: (context) => PostCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.red),
        // home: const FormValidationUsingBLoC(),
        onGenerateRoute: Routes.onGeneratedRoutes,
        initialRoute: "/home_screen",
      ),
    );
  }
}
