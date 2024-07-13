import 'package:cyber_royale/layout/widget/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../shared/styles/colors.dart';
import 'bloc/bloc.dart';
import 'bloc/social_events.dart';
import 'bloc/states.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialBloc, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("News Feed"),
            bottom: TabBar(
              controller: controller,
              padding: EdgeInsets.zero,
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(width: 4.0, color: defaultColor),
                  insets: EdgeInsets.symmetric(horizontal: 20)),
              tabs: [
                Tab(
                  child: Text(
                    "For you",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Tab(
                  child: Text(
                    "Following",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          body: state is SocialGetPostLoadingState
              ? const Center(child: CircularProgressIndicator())
              : state is SocialGetPostOnlySuccessState
              ? TabBarView(controller: controller, children: [
            RefreshIndicator(
              onRefresh: () async {
                context.read<SocialBloc>().add(GetPostsEvent());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      margin: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                            "https://lh3.googleusercontent.com/a/AAcHTtddAEBJHQgG0JUODqWsw2AydU4qjyf5iZgvkWV_UVRV6Q=s288-c-no",
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Communicate with friends",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                    state.posts.isEmpty
                        ? const Center(
                        child: Text("No posts available"))
                        : ListView.separated(
                      physics:
                      const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) =>
                          buildPostItem(
                              state.posts[index], context, index),
                      separatorBuilder:
                          (BuildContext context, int index) =>
                      const SizedBox(
                        height: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                "Soon...",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ])
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
