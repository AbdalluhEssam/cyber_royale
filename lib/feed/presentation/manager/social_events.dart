abstract class SocialEvent {}

class GetPostsEvent extends SocialEvent {}

class ChangeBottomNavEvent extends SocialEvent {
  final int index;

  ChangeBottomNavEvent(this.index);
}
