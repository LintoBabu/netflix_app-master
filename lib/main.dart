import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/HotAndNew/hot_and_new_bloc.dart';
import 'package:netflix_app/application/Search/bloc/search_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/domains/core/di/injectable.dart';
import 'package:netflix_app/presentation/mainPage/widgets/screen_main_page.dart';

import 'application/homePage/home_bloc.dart';

Future<void> main() async {
  await configureInjection();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => getIt<DownloadsBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<SearchBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<FastLaughBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<HotAndNewBloc>(),
        ),
        BlocProvider(
          create: (ctx) => getIt<HomeBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            primarySwatch: Colors.blue,
            textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                ),
                bodyText2: TextStyle(color: Colors.white))),
        home: screenMainpage(),
      ),
    );
  }
}
