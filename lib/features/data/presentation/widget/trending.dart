import 'package:flutter/material.dart';
import 'package:food/features/data/presentation/widget/custom_text.dart';

class trending extends StatelessWidget {
  const trending({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 237,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.45,
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
    );
  }
}
