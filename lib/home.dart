import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/models/today_likes.dart';
import 'package:food/notification.dart';
import 'package:food/widget/custom_text.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            Row(
              children: [
                const SizedBox(
                  height: 50,
                  width: 270,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Row(
                          children: [
                            TextCustom(
                              text: 'Search for products/stores',
                              color: Color.fromARGB(255, 160, 161, 160),
                              fontSize: 15,
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 49, 211, 125),
                            )
                          ],
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 239, 238, 239)),
                  ),
                ),
                const SizedBox(width: 2),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifications()),
                    );
                  },
                  icon: const Badge(
                    backgroundColor: Color.fromARGB(
                      255,
                      254,
                      1,
                      0,
                    ),
                    label: TextCustom(
                      text: '2',
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: Color.fromARGB(255, 255, 28, 28),
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  CupertinoIcons.tag,
                  color: Color.fromARGB(255, 254, 168, 42),
                )
              ],
            ),
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
              height: 230,
              width: double.infinity,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              children: [
                TextCustom(text: 'More'),
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
            const TextCustom(
              text: 'Trending',
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 237,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // width of each grid item
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.45, // width-to-height ratio
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'asset/images/trending/image.png',
                          height: 100,
                          width: 80,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: 'Mithas Bhandar',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextCustom(
                                text: 'Sweets, North Indian',
                                // fontSize: 17,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextCustom(
                                text: '(store location)  |  6.4 kms',
                                // fontSize: 17,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextCustom(
                                    text: '4.1  |  45 mins',
                                    // fontSize: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
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
                  fontSize: 15,
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
    );
  }
}

class LikeToDoWidgetItem extends StatelessWidget {
  const LikeToDoWidgetItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 0.1),
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: Stack(
            children: [
              getOfferText(index),
              getImage(index),
            ],
          ),
        ),
        Text(
          likeTodoList[index].title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          maxLines: 2,
        ),
      ],
    );
  }

  Align getImage(int index) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
          child: Image.asset(
        likeTodoList[index].icon,
        height: 35,
        width: 35,
      )),
    );
  }

  Widget getOfferText(int index) {
    return likeTodoList[index].offer != ""
        ? Align(
            alignment: Alignment.topRight,
            child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.purple,
                ),
                child: Text(
                  likeTodoList[index].offer,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                )),
          )
        : Container();
  }
}
