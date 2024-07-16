import 'package:cyber_royale/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyber_royale/shared/styles/themes.dart';
import 'feed/presentation/manager/bloc.dart';
import 'feed/presentation/manager/social_events.dart';
import 'feed/presentation/manager/states.dart';
import 'feed/presentation/pages/social_app.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialBloc()..add(GetPostsEvent()),
      child: BlocConsumer<SocialBloc, SocialState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Feed',
            theme: lightTheme,
            themeMode: ThemeMode.light,
            darkTheme: darkTheme,
            home: const FeedsScreen(),
          );
        },
      ),
    );
  }
}
