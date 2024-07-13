import 'package:cached_network_image/cached_network_image.dart';
import 'package:cyber_royale/modules/feeds/widget/post_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/styles/colors.dart';

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
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return cubit.posts.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                body: TabBarView(controller: controller, children: [
                  RefreshIndicator(
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
                                            .titleMedium!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ),
                              cubit.posts.isEmpty
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: cubit.posts.length,
                                      itemBuilder: (context, index) =>
                                          buildPostItem(
                                              cubit.posts[index],
                                              context,
                                              index),
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
                      onRefresh: () async {
                        cubit.getPost();
                      }),
                  Center(
                    child: Text("Soon..." , style: Theme.of(context).textTheme.bodyLarge,),
                  ),
                ]),
                appBar: AppBar(
                  toolbarHeight: 0,
                  bottom: TabBar(
                      // isScrollable: false,
                      controller: controller,
                      padding: EdgeInsets.zero,
                      indicator: const UnderlineTabIndicator(
                          borderSide:
                              BorderSide(width: 4.0, color: defaultColor),
                          insets: EdgeInsets.symmetric(horizontal: 20)),
                      tabs: [
                        Tab(
                          iconMargin: EdgeInsets.zero,
                          // height: 40,
                          // text: "For you",
                          child: Text(
                            "For you",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Tab(
                          iconMargin: EdgeInsets.zero,

                          // height: 40,
                          // text: "Following",
                          child: Text(
                            "Following",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ]),
                ),
              );
      },
    );
  }
}
