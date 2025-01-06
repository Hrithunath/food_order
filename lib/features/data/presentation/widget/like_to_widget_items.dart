import 'package:flutter/material.dart';
import 'package:food/features/data/domain/model/today_likes.dart';

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
                blurRadius: 5,
              )
            ],
          ),
          child: Stack(
            children: [
              getImage(index),
              getOfferText(index),
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
        ? Positioned(
            right: 2,
            top: 6,
            child: Container(
                height: 15,
                padding: const EdgeInsets.only(left: 5, right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(
                    255,
                    157,
                    55,
                    237,
                  ),
                ),
                child: Text(
                  likeTodoList[index].offer,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                )),
          )
        : Container();
  }
}
