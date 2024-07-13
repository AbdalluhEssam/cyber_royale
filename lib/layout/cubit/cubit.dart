import 'dart:developer';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cyber_royale/layout/cubit/states.dart';
import 'package:cyber_royale/models/post_model.dart';
import 'package:cyber_royale/modules/feeds/Feeds.dart';

import '../../shared/network/remote/http_helper.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  PostModel? postModel;

  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const FeedsScreen(),
    const FeedsScreen(),
    const FeedsScreen(),
  ];
  List<String> title = [
    'News Feed',
    'News Feed',
    'News Feed',
    'News Feed',
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }

  List<PostModel> posts = [];

  void getPost() async {
    emit(SocialGetPostLoadingState());

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await HttpHelper.getData('ozcan/posts.php');
        if (response != null && response['status'] == 'success') {
          List<dynamic> data = response['data'];
          posts = data.map((e) => PostModel.fromJson(e)).toList();
          emit(SocialGetPostOnlySuccessState());
        } else {
          throw 'Failed to load data';
        }
      } catch (e) {
        log('Error: $e');
        emit(SocialGetPostOnlyErrorState('Failed to fetch data: $e'));
      }
    } else {
      emit(SocialGetPostOnlyErrorState('No internet connection'));
    }
  }
}
