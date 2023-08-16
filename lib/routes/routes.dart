import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/cubit/generated_routes/first_cubit.dart';
import 'package:flutter_bloc_provider_example/cubit/generated_routes/third_cubit.dart';
import 'package:flutter_bloc_provider_example/presentation/screens/home_screen_with_comments.dart';
import 'package:flutter_bloc_provider_example/screens/first_screen.dart';
import 'package:flutter_bloc_provider_example/screens/second_screen.dart';
import 'package:flutter_bloc_provider_example/screens/third_screen.dart';

import '../cubit/generated_routes/second_cubit.dart';

class Routes {
  static Route? onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/home_screen":
        return MaterialPageRoute(
          builder: (context) => const HomeScreenWithComments(),
        );
      case "/first_screen":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => FirstCubit(),
            child: FirstScreen(),
          ),
        );
      case "/second_screen":
        Map<String, dynamic> argument = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SecondCubit(),
            child: SecondScreen(
              title: argument["title"],
            ),
          ),
        );
      case "/third_screen":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ThirdCubit(),
            child: ThirdScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
