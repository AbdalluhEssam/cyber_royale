import '../../data/models/post_model.dart';

abstract class SocialState {}

class SocialInitialState extends SocialState {}

class SocialChangeBottomNavState extends SocialState {
  final int currentIndex;

  SocialChangeBottomNavState(this.currentIndex);
}

class SocialGetPostLoadingState extends SocialState {}

class SocialGetPostOnlySuccessState extends SocialState {
  final List<PostModel> posts;

  SocialGetPostOnlySuccessState(this.posts);
}

class SocialGetPostOnlyErrorState extends SocialState {
  final String error;

  SocialGetPostOnlyErrorState(this.error);
}
