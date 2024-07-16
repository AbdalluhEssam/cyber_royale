import 'package:cyber_royale/feed/presentation/manager/social_events.dart';
import 'package:cyber_royale/feed/presentation/manager/states.dart';
import 'package:cyber_royale/feed/presentation/widgets/listofpost.dart';
import 'package:cyber_royale/feed/presentation/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/bloc.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialBloc, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News Feed"),
          ),
          body: state is SocialGetPostLoadingState
              ? const Center(child: LoadingShimmer())
              : state is SocialGetPostOnlySuccessState
                  ? RefreshIndicator(
                      onRefresh: () async {
                        context.read<SocialBloc>().add(GetPostsEvent());
                      },
                      child: Visibility(
                          visible: state.posts.isNotEmpty,
                          replacement:const Center(child: Text("No posts available")),
                          child: ListOfPost(state: state,)),
                    )
                  : Center(
                      child: Text(
                        state is SocialGetPostOnlyErrorState
                            ? state.error
                            : "Something went wrong",
                      ),
                    ),
        );
      },
    );
  }


}
