import 'package:bloc_example/firebase_options.dart';
import 'package:bloc_example/presentation/bloc/bloc_observer.dart';
import 'package:bloc_example/presentation/category/bloc/category_bloc.dart';
import 'package:bloc_example/presentation/home/bloc/home_bloc.dart';
import 'package:bloc_example/presentation/main/bloc/main_bloc.dart';
import 'package:bloc_example/presentation/main/main_page.dart';
import 'package:bloc_example/presentation/profile/bloc/profile_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainBloc>(
          create: (_) => MainBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc()..add(StoryEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
