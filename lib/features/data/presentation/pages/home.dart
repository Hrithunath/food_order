import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/features/data/domain/model/today_likes.dart';
import 'package:food/features/data/presentation/pages/notification.dart';
import 'package:food/features/data/presentation/widget/custom_text.dart';
import 'package:food/features/data/presentation/widget/like_to_widget_items.dart';
import 'package:food/features/data/presentation/widget/search_product.dart';
import 'package:food/features/data/presentation/widget/trending.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 26,
                      color: Color.fromARGB(255, 41, 208, 118),
                    ),
                    TextCustom(
                      text: 'ABCD, New Delhi',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color.fromARGB(255, 49, 211, 125),
                    )
                  ],
                ),
                const searchProduct(),
                const SizedBox(
                  height: 15,
                ),
                const TextCustom(
                  text: 'What would you like to do today?',
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 110,
                            childAspectRatio: 0.75),
                    itemBuilder: (context, index) {
                      return LikeToDoWidgetItem(index: index);
                    },
                    itemCount: likeTodoList.length,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(
                      text: 'More',
                      color: Color.fromARGB(
                        255,
                        49,
                        204,
                        120,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color.fromARGB(
                        255,
                        49,
                        204,
                        120,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextCustom(
                  text: 'Top picks for you',
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset('asset/images/banner/image.png'),
                const SizedBox(
                  height: 35,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'Trending',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    TextCustom(
                      text: 'See all',
                      color: Color.fromARGB(255, 6, 194, 94),
                      fontSize: 17,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                trending(),
                const SizedBox(
                  height: 10,
                ),
                const TextCustom(
                  text: 'Craze deals',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 160,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Image.asset(
                          'asset/images/craze deals/image.png',
                          height: 160,
                          width: 300,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('asset/images/refer & earn/image.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                      text: 'Nearby stores',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    TextCustom(
                      text: 'See all',
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 23, 197, 105),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'asset/images/near by stores/image.png',
                      height: 70,
                      width: 50,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextCustom(
                            text: 'Freshly Baker',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          const TextCustom(
                            text: 'Sweets, North Indian',
                            fontSize: 15,
                          ),
                          const TextCustom(
                            text: 'Site No - 1  |  6.4 kms',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const TextCustom(
                              text: 'Top store',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                            ),
                            SizedBox(width: 4),
                            TextCustom(
                              text: '4.1',
                              fontSize: 15,
                            ),
                            SizedBox(
                              width: 19,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        TextCustom(
                          text: '45 mins',
                          fontSize: 20,
                          color: Color.fromARGB(255, 237, 143, 32),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: Column(
                    children: [
                      const Divider(
                        height: 10,
                        color: Color.fromARGB(255, 218, 214, 214),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'asset/images/offer/image.png',
                            height: 13,
                            width: 13,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TextCustom(
                            text: 'Upto 10% OFF',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            'asset/images/offer/image..png',
                            height: 13,
                            width: 13,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TextCustom(
                            text: '3400+ items available',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 25),
                          backgroundColor: const Color.fromARGB(
                            255,
                            41,
                            208,
                            118,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          )),
                      child: const TextCustom(
                        text: 'View all stores',
                        color: Color.fromARGB(255, 235, 250, 242),
                        fontSize: 20,
                      )),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
