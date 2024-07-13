import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyber_royale/layout/cubit/cubit.dart';
import 'package:cyber_royale/layout/cubit/states.dart';

class SocialAppLayout extends StatelessWidget {
  const SocialAppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
        }
        if (state is SocialGetUserLoadingState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:Text(cubit.title[cubit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.notifications)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            ],
          ),
          body:  cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),

              ]),
        );
      },
    );
  }
}
