import 'package:cyber_royale/feed/presentation/widgets/post_widget.dart';
import 'package:flutter/material.dart';

import '../manager/states.dart';

class ListOfPost extends StatelessWidget {
 final SocialGetPostOnlySuccessState state;
  const ListOfPost({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.posts.length,
      itemBuilder: (context, index) =>buildPostItem(state.posts[index], context, index),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 10,
      ),
    );
  }
}
