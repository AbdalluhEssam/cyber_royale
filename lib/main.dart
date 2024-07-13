import 'package:cyber_royale/layout/cubit/states.dart';
import 'package:cyber_royale/shared/bloc_observer.dart';
import 'package:cyber_royale/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyber_royale/shared/styles/themes.dart';

import 'layout/cubit/cubit.dart';
import 'layout/social_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialCubit()..getPost(),
      child: BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            home: const SocialAppLayout(),
          );
        },
      ),
    );
  }
}
