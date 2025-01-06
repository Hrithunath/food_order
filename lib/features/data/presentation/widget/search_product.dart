import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/features/data/presentation/widget/custom_text.dart';

class searchProduct extends StatelessWidget {
  const searchProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Navigator.pushNamed(context, '/notification');
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
    );
  }
}
