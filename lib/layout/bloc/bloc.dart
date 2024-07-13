import 'dart:developer';
import 'package:cyber_royale/layout/bloc/social_events.dart';
import 'package:cyber_royale/layout/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:cyber_royale/models/post_model.dart';
import 'package:cyber_royale/shared/network/remote/http_helper.dart';

class SocialBloc extends Bloc<SocialEvent, SocialState> {
  SocialBloc() : super(SocialInitialState()) {
    on<GetPostsEvent>(_onGetPosts);
    on<ChangeBottomNavEvent>(_onChangeBottomNav);
  }

  int currentIndex = 0;
  List<PostModel> posts = [];

  void _onGetPosts(GetPostsEvent event, Emitter<SocialState> emit) async {
    emit(SocialGetPostLoadingState());

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final response = await HttpHelper.getData('ozcan/posts.php');
        if (response != null && response['status'] == 'success') {
          List<dynamic> data = response['data'];
          posts = data.map((e) => PostModel.fromJson(e)).toList();
          emit(SocialGetPostOnlySuccessState(posts));
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

  void _onChangeBottomNav(ChangeBottomNavEvent event, Emitter<SocialState> emit) {
    currentIndex = event.index;
    emit(SocialChangeBottomNavState(currentIndex));
  }
}
