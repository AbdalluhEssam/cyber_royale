import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../shared/styles/colors.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    double paddingValue = 0;
    switch (deviceType) {
      case DeviceScreenType.desktop:
        paddingValue = 48;
        break;
      case DeviceScreenType.tablet:
        paddingValue = 24;
        break;
      case DeviceScreenType.mobile:
        paddingValue = 12;
        break;
      default:
        paddingValue = 18;
        break;
    }
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Card(
              color: Colors.white,
              margin:  EdgeInsets.symmetric(horizontal: paddingValue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: width * 0.4,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 16,
                            )
                          ],
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: paddingValue),
                      child: Container(
                        height: 1.0,
                        width: double.infinity,
                        color: Colors.grey[300],
                      ),
                    ),
                    Text(
                      "",
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
                                  child: Container(
                                    height: 20,
                                    width: width * 0.3,
                                    color: Colors.grey,
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
                                  child: Container(
                                    height: 20,
                                    width: width * 0.3,
                                    color: Colors.grey,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsetsDirectional.only(top: paddingValue),
                      child: Card(
                          elevation: 5,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            height: height * 0.3,
                            decoration: const BoxDecoration(color: Colors.grey),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
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
                                  Container(
                                    height: 20,
                                    width: width * 0.3,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                            ),
                          )),
                          Expanded(
                              child: InkWell(
                            onTap: () {},
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
                                  Container(
                                    height: 20,
                                    width: width * 0.3,
                                    color: Colors.grey,
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
                      padding:  EdgeInsets.only(top: paddingValue),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {},
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey,
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
                            onTap: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  size: 25,
                                  color: Colors.grey,
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
            ),
        separatorBuilder: (context, index) =>  SizedBox(
              height: paddingValue,
            ),
        itemCount: 15);
  }
}
