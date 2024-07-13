
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import '../../../models/post_model.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/colors.dart';

Widget buildPostItem(PostModel model,context, index) =>
    Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: CachedNetworkImageProvider("https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-6/429661400_1881889898896546_7629568057278059140_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=tEAPirLWSusQ7kNvgGqU36Q&_nc_ht=scontent.fcai19-7.fna&oh=00_AYBGrgD4A6FQ_nSabMTyzL89NP9wIIP9Pv0lC46Wt8HU8Q&oe=66986051"),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(model.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(height: 1.4)),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 16,
                            )
                          ],
                        ),
                        Text(
                            DateFormat('d MMMM y  hh:mm:a', 'en_US')
                                .format(DateTime.parse(model.date)),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(height: 1.4)),
                      ],
                    )),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 1.0,
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Text(
              model.description,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Container(
              padding: const EdgeInsets.only(top: 3, bottom: 8),
              width: double.infinity,
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          height: 20,
                          onPressed: () {},
                          child: Text(
                            "#software",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          minWidth: 1.0,
                          padding: EdgeInsets.zero,
                          height: 20,
                          onPressed: () {},
                          child: Text(
                            "#flutter",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: defaultColor),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            if (model.image != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 10),
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: "https://abdalluh-essam.com/ozcan/upload/items/${model.image}",
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${model.count}",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      child: InkWell(
                        onTap: () {

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.chat,
                                size: 20,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "12 Comment",
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            ),
            Container(
              height: 1.0,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: () {

                        },
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundImage: CachedNetworkImageProvider(
                                  "https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-6/429661400_1881889898896546_7629568057278059140_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=tEAPirLWSusQ7kNvgGqU36Q&_nc_ht=scontent.fcai19-7.fna&oh=00_AYBGrgD4A6FQ_nSabMTyzL89NP9wIIP9Pv0lC46Wt8HU8Q&oe=66986051"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "write a comment ...",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      )),
                  InkWell(
                    onTap: () {

                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Like",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );